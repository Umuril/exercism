module Luhn (isValid) where
import Data.Char

doubleEveryValue :: [Int] -> [Int]
doubleEveryValue [] = []
doubleEveryValue [x] = [2*x]
doubleEveryValue (x:y:xs) = 2*x : y : doubleEveryValue xs

norm :: Int -> Int
norm n | n > 9 = n - 9 | otherwise = n

isValid :: String -> Bool
isValid n  = case map digitToInt $ reverse $ filter isDigit n of
    [] -> False
    [_] -> False
    (x:xs) -> (==) 0 $ flip mod 10 $ (+) x $ sum $ map norm $ doubleEveryValue xs