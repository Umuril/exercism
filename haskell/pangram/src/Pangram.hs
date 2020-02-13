module Pangram (isPangram) where
import Data.Char

isPangram :: String -> Bool
isPangram = and . flip map (map (==) ['a'..'z']) . flip any . map toLower