set -e

printf "===java===\n"
javac Bench.java
time java Bench

printf "\n===node===\n"
time node bench.js

printf "\n===racket classic===\n"
~/bin/racket/bin/raco make bench.rkt
time ~/bin/racket/bin/racket bench.rkt

printf "\n===haskell===\n"
stack exec -- ghc -O Bench.hs
time ./Bench