module Anagram (anagramsFor) where
import Data.List
import Data.Char

toUpperString :: String -> String
toUpperString = map toUpper

anagram :: String -> String -> Bool
anagram a b = a /= toUpperString b && sort a == sort (toUpperString b)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs = filter (anagram $ toUpperString xs)