{-# LANGUAGE StrictData #-}

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

main :: IO ()
main = putStrLn
     $ show
     $ foldl' union (r 25 25 200 200)
     -- [0..1e9] will go away forever due to the drop in Float precision
     $ map (r 20 0 100 . fromIntegral) ([0..1000000000] :: [Int])