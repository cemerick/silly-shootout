(ns bench)

(deftype Rectangle [^float lx ^float by ^float rx ^float ty])

(defn union [^Rectangle a ^Rectangle b]
  (Rectangle. (min (.-lx a) (.-lx b))
              (min (.-by a) (.-by b))
              (max (.-rx a) (.-rx b))
              (max (.-ty a) (.-ty b))))

(println (loop [i 0
                v (Rectangle. 25 25 200 200)]
           (if (== i 1000000000)
             (.-ty v)
             (recur (inc i) (union v (Rectangle. 20 0 100 i))))))

; a "proper" (->> range map reduce) treatment of this causes node to dump core
; "Ineffective mark-compacts near heap limit Allocation failed - JavaScript heap out of memory"
; :-(
;
; (println (->> (range 0 1000000000)
;               (map #(Rectangle. 20 0 100 %))
;               (reduce union (Rectangle. 25 25 200 200))
;               .-ty))
