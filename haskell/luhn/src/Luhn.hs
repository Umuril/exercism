module Luhn (isValid) where
import Debug.Trace
import Data.Char

traceThis :: (Show a) => a -> a
traceThis x = trace ("test: " ++ show x) x

doubleEveryValue :: [Int] -> [Int]
doubleEveryValue [] = []
doubleEveryValue [x] = [2*x]
doubleEveryValue (x:y:xs) = 2*x : y : doubleEveryValue xs

doubleEveryValue2 :: [Int] -> [Int]
doubleEveryValue2 xs = (reverse $ doubleEveryValue $ reverse $ init xs) ++ [last xs]

parseDigits :: [Char] -> [Int]
parseDigits = map digitToInt

norm :: (Ord p, Num p) => p -> p
norm n | n > 9 = n - 9 | otherwise = n

normalize :: [Int] -> [Int]
normalize list = map norm list

filtery :: [Char] -> [Char]
filtery = filter isDigit


isValid :: String -> Bool
isValid n | length n < 2 = False | otherwise = do
    let x = traceThis $ show $ sum $ normalize $ doubleEveryValue2 $ parseDigits $ filtery n;
    mod (sum $ normalize $ doubleEveryValue2 $ parseDigits n) 10 == 0;