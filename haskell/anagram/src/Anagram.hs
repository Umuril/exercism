module Anagram (anagramsFor) where
import Data.List
import Data.Char

areTheSame :: [String] -> Bool
areTheSame list | length list <= 1 = True
                | otherwise = (((list !! 0) == (list !! 1)) && areTheSame (drop 1 list))

areNotTheSame :: [String] -> Bool
areNotTheSame list = not (areTheSame list)

areNotTheSameCaseSensistive :: [String] -> Bool
areNotTheSameCaseSensistive list =  areNotTheSame (toUpperList list)


isAnagram :: [String] -> Bool
isAnagram list = areTheSame (map sort list)

isAnagramCaseSensistive :: [String] -> Bool
isAnagramCaseSensistive list = isAnagram (toUpperList list)


toUpperString :: String -> String
toUpperString s = map toUpper s

toUpperList :: [String] -> [String]
toUpperList list = map toUpperString list


anagram :: String -> String -> Bool
anagram a b = areNotTheSameCaseSensistive([a,b]) && isAnagramCaseSensistive([a,b])

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter (anagram xs) xss
