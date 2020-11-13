module Minesweeper (annotate) where
import qualified Data.Char as C
import qualified Data.Matrix as M
import qualified Data.Vector as V

-- TO BE REVIEWED

createTuple :: (Int, Int) -> Char -> (Int, Int, Char)
createTuple (r,c) value = (r, c, value)

isNear :: (Int, Int) -> (Int, Int) -> Bool
isNear (x1, y1) (x2, y2) = abs (x1 - x2) <= 1 && abs (y1 - y2) <= 1

setValue :: [(Int, Int)] -> (Int, Int) -> Char -> Char
setValue points (r,c) value
    | value == '*' = '*'
    | near == 0 = ' '
    | otherwise = C.intToDigit near
    where near = length $ filter (isNear (r, c)) points

annotate :: [String] -> [String]
annotate [] = []
annotate board = M.toLists $ M.mapPos (setValue [(x,y) | (x, y, value) <- V.toList $ M.getMatrixAsVector $ M.mapPos createTuple $ M.fromLists board, value == '*']) $ M.fromLists board
