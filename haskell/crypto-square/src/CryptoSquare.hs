module CryptoSquare (encode) where

import qualified Control.Monad as M
import qualified Data.Text as T
import qualified Data.Char as C

addTrailing :: Int -> [T.Text] -> [T.Text]
addTrailing = map . (`T.justifyLeft` ' ')

splitInchunks :: T.Text -> [T.Text]
splitInchunks xs = addTrailing r $ T.chunksOf r xs
    where 
        r = ceiling $ sqrt $ toDouble $ T.length xs
        toDouble = fromIntegral :: Int -> Double

removePunctuation :: T.Text -> T.Text
removePunctuation = T.filter $ not . isUnwanted
    where isUnwanted = M.liftM2 (||) C.isSpace C.isPunctuation

encode :: String -> String
encode = T.unpack . T.unwords . T.transpose . splitInchunks . T.toLower . removePunctuation . T.pack 