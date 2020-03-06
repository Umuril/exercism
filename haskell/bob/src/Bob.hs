module Bob (responseFor) where
import qualified Data.Char as C

isYelling :: String -> Bool
isYelling = and . sequence [not . null, all C.isUpper] . filter C.isAlpha

isQuestion :: String -> Bool
isQuestion [] = False
isQuestion xs = '?' == last $ filter (not . C.isSpace) xs

responseFor :: String -> String
responseFor xs  | all C.isSpace xs = "Fine. Be that way!"
                | isQuestion xs  = case () of 
                 _ | isYelling xs -> "Calm down, I know what I'm doing!"
                    | otherwise -> "Sure."
                | isYelling xs = "Whoa, chill out!"
                | otherwise = "Whatever."