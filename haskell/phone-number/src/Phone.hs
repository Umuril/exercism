module Phone (number) where

import qualified Data.Char as C
import Text.Regex.PCRE

if' :: (a -> Bool) -> a -> Maybe a
if' test value | test value = Just value | otherwise = Nothing

number :: String -> Maybe String
number xs = if' (not . null) ((filter C.isDigit xs) =~ "(?(?<=^1)([2-9][0-9]{2}){2}[0-9]{4}$|^([2-9][0-9]{2}){2}[0-9]{4}$)$" :: String) 