module CryptoSquare (encode) where
import qualified Data.Text as T
import qualified Data.Char as C

addTrailing :: Int -> [T.Text] -> [T.Text]
addTrailing = map . (`T.justifyLeft` ' ')

splitInchunks :: T.Text -> [T.Text]
splitInchunks xs = addTrailing r $ T.chunksOf r xs
    where r = ceiling $ sqrt $ (fromIntegral :: Int -> Double) $ T.length xs 

removePunctuation :: String -> String
removePunctuation = filter $ not . or . sequence [C.isSpace, C.isPunctuation]

toLowerString :: String -> String
toLowerString = map C.toLower

encode :: String -> String
encode = T.unpack . T.unwords . T.transpose . splitInchunks . T.pack . toLowerString . removePunctuation