module CollatzConjecture (collatz) where

import Data.List

nextNumber :: (Integer -> Maybe (Integer, Integer))
nextNumber n    | n < 2 = Nothing
                | mod n 2 == 0 = Just (n, quot n 2)
                | otherwise = Just (n, 3 * n + 1)

collatz :: Integer -> Maybe Integer
collatz x   | x < 1 = Nothing 
            | otherwise = Just $ toInteger $ length $ takeWhile (>1) $ unfoldr nextNumber x
