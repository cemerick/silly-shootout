None of this means anything. Take no conclusions.

On my laptop, current rankings:

haskell < node < java < tracket < racket < tracket (NO OPT)

```
=== haskell ===
[1 of 1] Compiling Main             ( Bench.hs, Bench.o )
Linking Bench ...
Rectangle {lx = 20.0, by = 0.0, rx = 200.0, ty = 1.0e9}
1.99s

=== node ===
{ lx: 20, by: 0, rx: 200, ty: 999999999 }
5.50s

=== java ===
Rectangle lx:20.0 by:0.0 rx:200.0 ty:1.0E9
6.99s

=== racket (classic) ===
(rectangle 20 0 200 999999999)
cpu time: 50885 real time: 50841 gc time: 817
51.06s

=== typed racket (classic) ===
'(20.0 0.0 200.0 999999999.0)
cpu time: 52861 real time: 52800 gc time: 1146
54.43s

=== typed racket (classic, optimizer OFF) ===
'(20.0 0.0 200.0 999999999.0)
cpu time: 35549 real time: 35513 gc time: 615
35.89s
```
