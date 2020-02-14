module Minesweeper (annotate) where
import qualified Data.Char as C
import qualified Data.Matrix as M
import qualified Data.Vector as V
import Debug.Trace

traceThis :: (Show a) => a -> a
traceThis x = trace ("test: " ++ show x) x

if' :: Bool -> a -> a -> a
if' True  x _ = x
if' False _ y = y

opt' :: a -> a -> a
opt' value def | null value = def | otherwise = value

toChar :: Int -> Char
toChar 0 = ' '
toChar x = C.intToDigit x

check :: Int -> (Int -> Int -> Bool) -> Int -> Int
check a op b | op a b = traceThis a | otherwise = traceThis b

countAround :: M.Matrix Char -> Char
countAround m   | m M.! (2,2) == '*' = '*' 
                | otherwise = toChar( V.length( V.filter (\x -> x == '*') (M.getMatrixAsVector m)))

swipe :: M.Matrix Char -> M.Matrix Char
swipe m = M.mapPos (\(r,c) _ -> countAround (M.submatrix (check (r-1) (>) 1) (check (c-1) (>) 1) (check (r+1) (<) (M.nrows m)) (check (c+1) (<) (M.ncols m)) m)) m

annotate :: [String] -> [String]
annotate board = do
    let x = []
    

-- Iterare su tutti i caratteri e prendersi una lista delle posizioni di ogni *
-- Per ogni punto nella matrice contare tutti gli asterischi che sono a "distanza di 1"