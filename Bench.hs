{-# LANGUAGE Strict #-}

import Data.List (foldl')

data Rectangle = Rectangle { lx :: Float
                           , by :: Float
                           , rx :: Float
                           , ty :: Float } deriving Show

r = Rectangle

union (Rectangle alx aby arx aty)
      (Rectangle blx bby brx bty) =
  Rectangle (min alx blx)
            (min aby bby)
            (max arx brx)
            (max aty bty)

-- runs for minutes, before being manually killed
-- no one knows how to get folds over very large
-- lists to work in haskell >.>

main :: IO ()
main = putStrLn
     $ show
     $ foldl' union (r 25 25 200 200)
     $ map (r 20 0 100) [0..1e9]