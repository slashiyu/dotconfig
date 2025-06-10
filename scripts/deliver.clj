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

(defn src-and-dest-dir-pair [dest-dir {:keys [ filename group ] :as pair}]
  (-> {}
      (assoc :src filename)
      (assoc :dest-dir (join-path dest-dir group))))

(defn convert-path [dest-dir edn-data]
  (map #(src-and-dest-dir-pair dest-dir %) edn-data))

(defn create-dest-dirs [edn-data]
  (doseq [dir (set (map :dest-dir edn-data))]
    (fs/create-dirs dir)))

(defn move-files [edn-data]
  (doseq [{:keys [src dest-dir]} edn-data]
    (fs/move src dest-dir)))

(defn deliver [dest-dir edn-data]
  (let [converted-edn-data (convert-path dest-dir edn-data)]
    (do (create-dest-dirs converted-edn-data)
        (move-files converted-edn-data))))

(defn main []
  (let [dest-dir (first *command-line-args*)]
    (deliver dest-dir (edn/read *in*))))

(main)

;;(prn (set (map :dest-dir [{:dest-dir "a"} {:dest-dir "b"} {:dest-dir "c"} {:dest-dir "b"}])))
;;(prn (src-and-dest-dir-pair "a/b/c" {:filename "file1", :group "x/y/z" }))
