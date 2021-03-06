{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
module ClassyPrelude.Set
    ( Set
    ) where

import qualified Prelude
import Prelude ((.), Char)
import ClassyPrelude.Classes
import Data.Set (Set)
import qualified Data.Set as Set

instance (Prelude.Ord a, Prelude.Ord b) => CanMapFunc (Set a) (Set b) a b where
    mapFunc = Set.map
instance CanLength (Set x) Prelude.Int where
    length = Set.size
instance CanSingleton (Set x) x where
    singleton = Set.singleton
instance CanNull (Set x) where
    null = Set.null
instance Prelude.Ord x => CanPack (Set x) x where
    pack = Set.fromList
    unpack = Set.toList
instance (Prelude.Ord x, Set x ~ s, x ~ x') => CanInsert (x' -> s -> Set x) where
    insert = Set.insert
instance Prelude.Ord x => CanMember (Set x) x where
    member = Set.member

instance CanFoldFunc (Set a) a accum where
    foldFunc = Set.foldl'
