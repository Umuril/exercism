module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

toText :: Int -> Maybe Int -> Maybe Classification
toText n (Just s)   | s == n = Just Perfect
                    | s > n = Just Abundant
                    | s < n = Just Deficient
toText _ _ = Nothing

divisors :: Int -> [Int]
divisors 1 = [0]
divisors n = filter ((==) 0 . rem n) [1..(n - 1)]

sum' :: [Int] -> Maybe Int
sum' [] = Nothing
sum' xs = Just $ sum xs

classify :: Int -> Maybe Classification
classify n = toText n $ sum' $ divisors n
