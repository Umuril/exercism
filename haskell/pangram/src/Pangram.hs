module Pangram (isPangram) where
import Data.Char

isPangram :: String -> Bool
isPangram [] = False
isPangram text = flip all ['a'..'z'] $ flip elem $ map toLower text