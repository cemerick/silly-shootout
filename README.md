None of this means anything. Take no conclusions.

On my laptop:

```
===java===
Rectangle lx:20.0 by:0.0 rx:200.0 ty:1.0E9

real    0m6.974s
user    0m6.765s
sys     0m0.328s

===node===
{ lx: 20, by: 0, rx: 200, ty: 999999999 }

real    0m5.655s
user    0m5.837s
sys     0m0.289s

===racket classic===
(rectangle 20 0 200 999999999)
cpu time: 49024 real time: 48984 gc time: 805

real    0m49.204s
user    0m48.868s
sys     0m0.376s
```

The Haskell impl never finishes (perhaps because I'm an idiot).