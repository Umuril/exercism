module SecretHandshake (handshake) where
import qualified Data.Bits as B

operate :: [String] -> Int -> [String]
operate xs bin | B.testBit bin 0 = xs ++ ["wink"]
               | B.testBit bin 1 = xs ++ ["double blink"]
               | B.testBit bin 2 = xs ++ ["close your eyes"]
               | B.testBit bin 3 = xs ++ ["jump"]
               | B.testBit bin 4 = reverse xs
               | otherwise = xs

handshake :: Int -> [String]
handshake n = foldl operate [] [B.bit x B..&. n | x <- [0..4]]