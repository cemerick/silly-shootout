set -e

export PATH="$PATH:~/bin/racket/bin:../racket/racket/bin"

function run {
  time=999999

  for i in `seq 1 $1`;
  do
    nt=$(/usr/bin/time -f "%e" "${@:2}" 2>&1 > /dev/null)
    time=`python2 -c "print min($time, $nt)"`
  done
  echo "${time}s"
}

printf "\n=== c++ ===\n"
rm -rf a.out
g++ -O3 -march=native bench.cpp
run 5 ./a.out

printf "\n=== rust ===\n"
rm -rf Bench
rustc -O Bench.rs
run 5 ./Bench

printf "\n=== haskell ===\n"
rm -f Bench *.hi *.o
stack exec -- ghc -O Bench.hs > /dev/null
run 5 ./Bench

printf "\n=== ocaml (\`ocamlopt.opt -O3\`, +fp+flambda) ===\n"
cd ocaml
rm -f *.cm* *.js* *.out *.o
ocamlopt.opt -O3 bench.ml
run 4 ./a.out
cd ..

printf "\n=== node ===\n"
run 4 node bench.js

printf "\n=== java ===\n"
rm -rf *.class
javac Bench.java
run 4 java Bench

printf "\n=== bucklescript (reason) ===\n"
cd ocaml
rm -f *.cm* *.js* *.out
bsc bench.ml
run 3 node bench.js
cd ..

printf "\n=== js_of_ocaml ===\n"
cd ocaml
rm -f *.cm* *.js* *.out
ocamlc bench.ml && js_of_ocaml --opt=3 a.out
run 2 node a.js
cd ..

printf "\n=== Clojure ===\n"
run 3 clj -J-server cljs/src/bench.cljs

printf "\n=== racket (classic) ===\n"
rm -rf compiled
raco make bench.rkt
run 2 racket bench.rkt

printf "\n=== ClojureScript ===\n"
cd cljs
rm -rf out
clj -m cljs.main -co '{:warnings {:single-segment-namespace false}}' --target node --optimizations advanced -c bench
run 2 node out/main.js
cd ..

printf "\n=== racket (chez) ===\n"
rm -rf compiled
racocs make bench.rkt
run 2 racketcs bench.rkt

printf "\n=== typed racket (classic) ===\n"
rm -rf compiled
raco make bencht.rkt
run 2 racket bencht.rkt

printf "\n=== typed racket (chez) ===\n"
rm -rf compiled
unset PLT_TR_NO_OPTIMIZE
racocs make bencht.rkt
run 2 racketcs bencht.rkt

printf "\n=== typed racket (classic, optimizer OFF) ===\n"
rm -rf compiled
export PLT_TR_NO_OPTIMIZE=n
raco make bencht.rkt
run 2 racket bencht.rkt

printf "\n=== typed racket (chez, optimizer OFF) ===\n"
rm -rf compiled
export PLT_TR_NO_OPTIMIZE=n
racocs make bencht.rkt
run 2 racketcs bencht.rkt

printf "\n=== node (generators) ===\n"
run 2 node bench-lazy.js
