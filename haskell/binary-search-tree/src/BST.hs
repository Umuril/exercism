module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where

import qualified Data.List as L

data BST a = HACK | Node (BST a) a (BST a) deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft HACK = Nothing
bstLeft (Node HACK _ _) = Nothing
bstLeft (Node l _ _) = Just l

bstRight :: BST a -> Maybe (BST a)
bstRight HACK = Nothing
bstRight (Node _ _ HACK) = Nothing
bstRight (Node _ _ r) = Just r

bstValue :: BST a -> Maybe a
bstValue HACK = Nothing
bstValue (Node _ v _) = Just v

empty :: BST a
empty = HACK 

fromList :: Ord a => [a] -> BST a
fromList [] = HACK
fromList xs = L.unfoldr insert HACK
fromList (h:t) = ctree2 (Node HACK h HACK) t
	where
		ctree2 = foldl (flip . insert)

insert :: Ord a => a -> BST a -> BST a
insert x HACK = Node HACK x HACK
insert x (Node l v r) = HACK
-- insert x Nothing = singleton x
-- insert x tree | x < value tree && isNothing $ left tree = BST (insert x $ left tree) (value tree) (right tree)

singleton :: a -> BST a
singleton x = Node HACK x HACK

toList :: BST a -> [a]
toList HACK = []
toList (Node l v r) = toList l ++ [v] ++ toList r
