module Phone (number) where

import qualified Data.Char as C
import Text.Regex.PCRE
import Debug.Trace

traceThis :: (Show a) => a -> a
traceThis x = trace ("test: " ++ show x) x

eve :: (a -> Bool) -> a -> Maybe a
eve test value | test value = Just value | otherwise = Nothing

number :: String -> Maybe String
number xs = eve (not . null) ((filter C.isDigit xs) =~ "(?(?<=^1)([2-9][0-9]{2}){2}[0-9]{4}$|^([2-9][0-9]{2}){2}[0-9]{4}$)$" :: String) 