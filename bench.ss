(export main) 
(import :std/format)

(defstruct rectangle (lx by rx ty)
  final: #t)

(defmethod {print rectangle}
  (lambda (self)
    (with ((rectangle lx by rx ty) self)
      (printf "{rectangle ~a ~a ~a ~a}~n" lx by rx ty))))

(def union
  (lambda (r1 r2)
    (with (((rectangle lx1 by1 rx1 ty1) r1)
           ((rectangle lx2 by2 rx2 ty2) r2))
      (rectangle (min lx1 lx2)
                 (min by1 by2)
                 (max rx1 rx2)
                 (max ty1 ty2)))))

(def fold
  (lambda (i r)
    (if (= i 0)
      r
      (fold (- i 1) (union r (make-rectangle 20 0 100 i))))))

(def main
  (lambda ()
    {print (fold 1000000000 (make-rectangle 25 25 200 200))}))