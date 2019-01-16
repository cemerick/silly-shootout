set -e

export PATH="$PATH:~/bin/racket/bin:../racket/racket/bin"

function run {
  time=999999

  for i in `seq 1 $1`;
  do
    nt=$(/usr/bin/time -f "%e" "${@:2}" 2>&1 > /dev/null)
    time=`python -c "print min($time, $nt)"`
  done
  echo "${time}s"
}

printf "\n=== rust ===\n"
rm -rf Bench
rustc -O Bench.rs
run 3 ./Bench

printf "\n=== haskell ===\n"
rm -f Bench *.hi *.o
stack exec -- ghc -O Bench.hs > /dev/null
run 3 ./Bench

printf "\n=== node ===\n"
run 3 node bench.js

printf "\n=== java ===\n"
rm -rf *.class
javac Bench.java
run 3 java Bench

cd ocaml
rm -f *.cm* *.js* *.out
printf "\n=== bucklescript (reason) ===\n"
bsc bench.ml
run 3 node bench.js

printf "\n=== racket (classic) ===\n"
rm -rf compiled
raco make bench.rkt
run 2 racket bench.rkt

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

printf "\n=== js_of_ocaml ===\n"
rm -f *.cm* *.js* *.out
ocamlc bench.ml && js_of_ocaml --opt=3 a.out
run 3 node a.js
cd ..

printf "\n=== node (generators) ===\n"
run 2 node bench-lazy.js
