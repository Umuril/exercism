module CollatzConjecture (collatz) where

import Data.Maybe

-- TO REFACTOR

nextN :: Integer -> Integer
nextN n    | mod n 2 == 0 = quot n 2
           | otherwise = 3 * n + 1

collatz :: Integer -> Maybe Integer
collatz x   | x == 1 = Just 0
            | x > 1  = Just $ 1 + fromJust (collatz $ nextN x)
            | otherwise = Nothing
