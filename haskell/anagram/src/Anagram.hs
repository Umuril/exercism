module Anagram (anagramsFor) where
import Data.List
import Data.Char

areTheSame :: [String] -> Bool
areTheSame list = and $ zipWith (==) list (tail list)

toUpperList :: [String] -> [String]
toUpperList = map (map toUpper)

anagram :: String -> String -> Bool
anagram a b = and $ sequence [not . areTheSame, areTheSame . map sort] $ (toUpperList [a, b])

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter (anagram xs) xss