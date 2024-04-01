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

(defn data-pairs-list [data-headers data-values-list]
  (map (fn [x] (data-pairs data-headers x)) data-values-list))

(defn depivot-body [const-values-list data-headers data-values-list]
  (for [const-values const-values-list
        [data-header data-value] (apply concat (data-pairs-list data-headers data-values-list))]
    (-> (apply vector const-values)
        (conj data-header)
        (conj data-value))))

(defn depivot [const-count values]
  (let [header (first values)
        const-headers (take const-count header)
        data-headers (drop const-count header)
        data (rest values)
        const-values-list (map (fn [x] (take const-count x)) data)
        data-values-list (map (fn [x] (drop const-count x)) data)]
    (concat (list (depivot-header const-headers))
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

(main)
