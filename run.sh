set -e

function run {
  /usr/bin/time -f "%es" "$@"
}

printf "\n=== haskell ===\n"
rm Bench *.hi *.o
stack exec -- ghc -O Bench.hs
run ./Bench

printf "\n=== node ===\n"
run node bench.js

printf "\n=== java ===\n"
rm -rf *.class
javac Bench.java
run java Bench

printf "\n=== racket (classic) ===\n"
rm -rf compiled
~/bin/racket/bin/raco make bench.rkt
run ~/bin/racket/bin/racket bench.rkt

printf "\n=== typed racket (classic) ===\n"
rm -rf compiled
~/bin/racket/bin/raco make bencht.rkt
run ~/bin/racket/bin/racket bencht.rkt

printf "\n=== typed racket (classic, optimizer OFF) ===\n"
rm -rf compiled
export PLT_TR_NO_OPTIMIZE=n
~/bin/racket/bin/raco make bencht.rkt
run ~/bin/racket/bin/racket bencht.rkt
