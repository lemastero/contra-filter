module Data.ContraFilter (
  ContraFilter
  )
  where

import Prelude hiding (filter)

-- Contravariant version of Filterable
-- Formally it is contravariant functor from Kleisli Maybe to Hask
-- laws
-- contraMaybe (Just . f) ≡ contramap f
-- contraMaybe f . contraMaybe g = contraMaybe g <=< f
class Contravariant f => ContraFilter f where
  contraMaybe :: (b -> Maybe a) -> f a -> f b

instance ContraFilter f => Filter f where
  filter = contraMaybe id

instance Predicate f => ContraFilter f where
  contraMaybe g p = _

-- Generalization of ContraFilter
-- instead of Maybe we have Traversable
-- Formally it is contravariant functor from Kleisli Traversable to Hask
-- laws
-- preTraverseFilter (pure . f) ≡ preTraverseFilter f
-- preTraverseFilter f . preTraverseFilter g = preTraverseFilter g <=< f
class Contravariant f => ContraTraverseFilter f where
  preTraverseFilter :: Traversable t => (b -> t a) -> f a -> f b

instance ContraTraverseFilter f => ContraFilter f where
  filter = contraMaybe id
