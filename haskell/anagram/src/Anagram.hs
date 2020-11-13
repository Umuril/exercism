module Anagram (anagramsFor) where
import Data.List
import Data.Char

toLowerString :: String -> String
toLowerString = map toLower

anagram :: String -> String -> Bool
anagram a b = a /= c && sort a == sort c
    where c = toLowerString b 

anagramsFor :: String -> [String] -> [String]
anagramsFor = filter . anagram . toLowerString