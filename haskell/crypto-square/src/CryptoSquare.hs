module CryptoSquare (encode) where
import qualified Data.Text as T
import qualified Data.Char as C

concatStrings :: [T.Text] -> T.Text
concatStrings xs = T.intercalate (T.pack " ") xs

trasposeMatrix :: [T.Text] -> [T.Text]
trasposeMatrix [] = []
trasposeMatrix xs   | all T.null xs = [] 
                    | any T.null xs = trasposeMatrix ( filter (not . T.null) xs )
                    | otherwise  = (T.pack $ map T.head xs) : trasposeMatrix (map T.tail xs)

addTrailing :: Int -> [T.Text] -> [T.Text]
addTrailing _ [] = []
addTrailing n (x:xs) = T.justifyLeft n ' ' x : addTrailing n xs

splitInchunks :: T.Text -> [T.Text]
splitInchunks xs = do
    let r = ceiling $ sqrt $ (fromIntegral :: Int -> Double) $ T.length xs
    addTrailing r (T.chunksOf r xs)

toLowerString :: T.Text -> T.Text
toLowerString xs = T.toLower xs

removePunctuation :: T.Text -> T.Text
removePunctuation xs = T.filter (\x -> not $ C.isSpace x || C.isPunctuation x) xs

encode :: String -> String
encode xs =  T.unpack $ concatStrings $ trasposeMatrix $ splitInchunks $ toLowerString $ removePunctuation $ T.pack xs