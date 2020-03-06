module WordCount (wordCount) where
import qualified Data.Array as A
import qualified Data.Char as C
import qualified Data.Map as M
import qualified Text.Regex as R
import qualified Text.Regex.Base.RegexLike as RL

frequency :: [String] -> [(String, Int)]
frequency xs = M.toList (M.fromListWith (+) [(map C.toLower x, 1) | x <- xs])

wordCount :: String -> [(String, Int)]
wordCount xs = frequency $ map (head . map fst . A.elems) $ RL.matchAllText (R.mkRegex "[a-zA-Z0-9]([a-zA-Z0-9']*[a-zA-Z0-9])?") xs