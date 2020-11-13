module Prime (nth) where

-- Waiting for approval

isPrime :: Integer -> Bool
isPrime n   | n == 1 = False 
            | n == 2 = True 
            | not $ null [x | x <- [2 .. n-1], mod n x == 0] = False 
            | otherwise = True

nth :: Int -> Maybe Integer
nth 0 = Nothing
nth n = Just (filter isPrime [1..] !! (n-1))
