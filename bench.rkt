#lang racket

(require racket/struct)
(require racket/stream)

(struct rectangle [lx by rx ty]
  #:transparent)

(define (as-list r) (list (lx r) (by r) (rx r) (ty r)))

(define r rectangle)
(define lx rectangle-lx)
(define by rectangle-by)
(define rx rectangle-rx)
(define ty rectangle-ty)

(define (union r1 r2)
  (rectangle (min (lx r1) (lx r2))
             (min (by r1) (by r2))
             (max (rx r1) (rx r2))
             (max (ty r1) (ty r2))))

(time
 (println (for/fold ([area (r 25 25 200 200)])
                    ([i (in-range 1e9)])
            (values (union area (r 20 0 100 i))))))