None of this means anything. Take no conclusions.

On my laptop, current rankings: haskell < node < java < racket

```
===java===
Rectangle lx:20.0 by:0.0 rx:200.0 ty:1.0E9

real    0m6.715s
user    0m6.506s
sys     0m0.297s

===node===
{ lx: 20, by: 0, rx: 200, ty: 999999999 }

real    0m5.503s
user    0m5.653s
sys     0m0.213s

===racket classic===
(rectangle 20 0 200 999999999)
cpu time: 47905 real time: 47866 gc time: 787

real    0m48.095s
user    0m47.673s
sys     0m0.452s

===haskell===
Rectangle {lx = 20.0, by = 0.0, rx = 200.0, ty = 1.0e9}

real    0m1.957s
user    0m1.957s
sys     0m0.000s
```
