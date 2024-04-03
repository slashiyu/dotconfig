#!/usr/bin/env bb

(require '[clojure.java.io :as io])
(require '[clojure.string :as str])
(require '[babashka.fs :as fs])

(defn join-line [values]
  (str/join #"," values))

(defn split-line [values]
  (map (fn [x] (str/split x #",")) values))

(defn depivot-header [const-header]
  (->
   (apply vector const-header)
   (conj "v1")
   (conj "v2")))

(defn data-pairs [data-headers data-values]
  (map vector data-headers data-values))

(defn depivot-body [const-values-list data-headers data-values-list]
  (map concat
       (apply concat (map (fn [x] (repeat (count data-headers) x)) const-values-list))
       (apply concat (map (fn [x] (data-pairs data-headers x)) data-values-list))))

(defn depivot [const-count values]
  (let [header (first values)
        [const-headers data-headers] (split-at const-count header)
        data (rest values)
        splited-data (map (fn [x] (split-at const-count x)) data)
        [const-values-list data-values-list] (apply map vector splited-data)]
    (concat (vector (depivot-header const-headers))
            (depivot-body const-values-list data-headers data-values-list))))

(defn depivot-csv [const-count lines]
  (->>
   (split-line lines)
   (depivot const-count)
   (map join-line)))

(defn main []
  (let [in-filename (first *command-line-args*)
        out-filename (second *command-line-args*)
        const-count (Integer/parseInt (nth *command-line-args* 2))]
    (->>
     (fs/read-all-lines in-filename)
     (depivot-csv const-count)
     (fs/write-lines out-filename))))


(require '[clojure.test :as t])
(def dotest (= "--test" (first *command-line-args*)))

(when dotest
  (do
    (t/deftest test-depivot-body
      (t/is (= '((1 2 :c true) (1 2 :d false) (11 12 :c false) (11 12 :d true))
               (depivot-body '((1 2) (11 12)) '(:c :d) '((true false) (false true))))))
    (t/deftest test-depivot
      (t/is (= '((:a :b "v1" "v2") (1 2 :c true) (1 2 :d false) (11 12 :c false) (11 12 :d true))
               (depivot 2 '((:a :b :c :d) (1 2 true false) (11 12 false true))))))
    (t/run-tests)))


(when (not dotest)
  (main))
