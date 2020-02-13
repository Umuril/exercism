module Acronym (abbreviate) where
import Data.List (intercalate)
import Data.List.Split (splitOneOf)
import Data.Maybe
import Data.Char
import Text.Regex

extractAcronym :: String -> String
extractAcronym word | isJust $ matchRegex (mkRegex "^[A-Z]+$") word = [head word]
                    | isJust $ matchRegex (mkRegex "^[a-z]+$") word = [toUpper $ head word]
                    | isJust $ matchRegex (mkRegex "^[A-Z]") word = filter isUpper word
                    | isJust $ matchRegex (mkRegex "^[a-zA-Z]+[!-?][a-zA-Z]+$") word = intercalate "" $ map extractAcronym $ splitOneOf "!-?" word
                    | isJust $ matchRegex (mkRegex "^[^\\w\\s]*[A-Za-z]") word = extractAcronym $ tail word
                    | otherwise = ""

abbreviate :: String -> String
abbreviate xs = intercalate "" (map extractAcronym (words xs))
