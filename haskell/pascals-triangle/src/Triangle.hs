module Triangle (rows) where
import qualified Data.List as L

nextRow :: [Integer] -> Maybe ([Integer], [Integer])
nextRow row = Just (row, zipWith (+) (row ++ [0]) ([0] : row))

rows :: Int -> [[Integer]]
rows x = take x $ L.unfoldr nextRow [1]