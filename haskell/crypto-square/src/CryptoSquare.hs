{-# LANGUAGE OverloadedStrings #-}

module CryptoSquare (encode) where
import qualified Data.Text as T
import qualified Data.Char as C

addTrailing :: Int -> [String] -> [String]
addTrailing n = map $ T.justifyLeft n ' '

splitInchunks :: String -> [String]
splitInchunks xs = addTrailing r (T.chunksOf r xs)
    where r = ceiling $ sqrt $ (fromIntegral :: Int -> Double) $ T.length xs 

removePunctuation :: String -> String
removePunctuation = T.filter $ not . or . sequence [C.isSpace, C.isPunctuation]

encode :: String -> String
encode = T.unwords . T.transpose . splitInchunks . T.toLower . removePunctuation