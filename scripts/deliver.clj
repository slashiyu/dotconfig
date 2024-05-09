#!/usr/bin/env bb

;; Input edn format
;;
;; [
;;    {:group "a/b/c" :filename "xxxx.xxx"}
;;    .....
;; ]

(ns script
  (:require
   [babashka.fs :as fs]
   [clojure.edn :as edn]
   [clojure.string :as string]))

(defn join-path [path1 path2]
  (string/join "/" [path1 path2]))

(defn convert-path [dest-dir edn-data]
  (let [join-path-dest-dir #(join-path dest-dir %)]
    (map #(update % :group join-path-dest-dir) edn-data)))

(defn create-dest-dirs [edn-data]
  (doseq [dir (map first (group-by :group edn-data))]
    (fs/create-dirs dir)))

(defn move-files [edn-data]
  (doseq [x edn-data]
    (fs/move (:filename x) (:group x))))

(defn deliver [dest-dir edn-data]
  (let [converted-edn-data (convert-path dest-dir edn-data)]
    (do (create-dest-dirs converted-edn-data)
        (move-files converted-edn-data))))

(defn main []
  (let [dest-dir (first *command-line-args*)]
    (deliver dest-dir (edn/read *in*))))

(main)
