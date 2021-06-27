module Data.Filter (
  Filter
  )
  where

import Prelude hiding (filter)

-- Filter capture filtering of any f a
-- regardless if f is a Functor, Contravariant or something else
--
-- laws
-- filter const true = id
-- filter (f . g) = filter f . filter g
class Filter f where
  filter :: f a -> (a -> Bool) -> f a

filterNot :: Filter f => f a -> (a -> Bool) -> f a
filterNot fa p = filter fa (\x -> not (f a))
