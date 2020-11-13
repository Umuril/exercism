module Acronym (abbreviate) where
import Data.List (intercalate)
import Data.List.Split (splitOneOf)
import Data.Maybe
import Data.Char
import Text.Regex

regexes :: [(String, String -> String)]
regexes = [
    ("^[A-Z]+$", (:[]) . head),
    ("^[a-z]+$", (:[]) . toUpper . head),
    ("^[A-Z]", filter isUpper),
    ("^[a-zA-Z!?-]+$", intercalate "" . map extractAcronym . splitOneOf "-!?"),
    ("^[\\w\\s_]+[A-Za-z]", extractAcronym . tail)
    ]

extractAcronym :: String -> String
extractAcronym word = case filter (\reg -> isJust $ matchRegex (mkRegex $ fst reg) word) regexes of
                    [] -> ""
                    (x:_) -> snd x word

abbreviate :: String -> String
abbreviate xs = intercalate "" (map extractAcronym (words xs))
