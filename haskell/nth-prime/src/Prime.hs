module Prime (nth) where

is_prime :: Integer -> Bool
is_prime n | n == 1 = False | n == 2 = True | (length [x | x <- [2 .. n-1], mod n x == 0]) > 0 = False | otherwise = True

nth :: Int -> Maybe Integer
nth n | n == 0 = Nothing | otherwise = Just ((filter is_prime [1..]) !! (n-1))