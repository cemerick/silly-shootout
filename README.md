None of this means anything. Take no conclusions. Read below if you're asking, "why?".

On my laptop:

```
=== c++ ===
1.12s

=== rust ===
1.88s

=== haskell ===
1.98s

=== ocaml (`ocamlopt.opt -O3` +fp+flambda) ===
2.93s

=== node ===
5.54s

=== java ===
6.43s

=== bucklescript (reason) ===
9.52s

=== js_of_ocaml ===
12.07s

=== Clojure ===
13.84s

=== gerbil (via gambit) ===
15.87s

=== racket (classic) ===
35.99s

=== ClojureScript ===
36.63s

=== typed racket (classic, optimizer OFF) ===
37.86s

=== typed racket (classic) ===
38.06s

=== racket (chez) ===
45.47s

=== typed racket (chez) ===
43.07s

=== typed racket (chez, optimizer OFF) ===
49.75s

=== node (generators) ===
71.5s
```

Runtime/language versions:

* g++ 7.5.0
* Rust 1.31.0
* GHC 8.4.3
* Gerbil v0.16-DEV-555-ga1e5f5ee on Gambit v4.9.3
* Node 10.13.0
* OpenJDK 11.0.1
* Racket v7.1
* Racket-on-Chez v7.1.0.10 (git sha 8ce8058796)

### Motivation

With a new-ish project with some new-ish requirements, I thought it would be
reasonable to do a survey of the programming languages (and runtimes!)
available to me, rather than simply nailing away with the same couple of
hammers I've come to use on reflex.

I have many criteria in mind, but performance is near the top, and so a
bakeoff seemed like an amusing and effective way to get a feel for
candidates, as well as motivate my writing some real(ish) code in each of
them. The results so far are the programs herein, and the results above.

These programs all do the same thing, which is intended to barely reflect the
kind of workload I'm anticipating.

_Update_, 2020-ish: I made my decision (at least for a while) last year, but
people keep golfing these implementations and offering new ones. Feel free to
do the same.

### Why these languages / runtimes?

I intend to continue using tools that emphasize functional programming
fundamentals — in particular, (usually!) immutable data structures — and will
need to make heavy use of lazy streams to process and transform that data.
Thus, I've tried to write these toy programs to match that general
orientation. This bakeoff is thus comparing allocation, GC (or freeing), and
function invocation, and not a lot else.

For those languages that don't suit that description typically (e.g.
JavaScript and Java), I'd actually consider languages that target
their runtimes, but it is good to know what their performance floor is, so a
few programs use imperative iteration rather than streams/generators.
