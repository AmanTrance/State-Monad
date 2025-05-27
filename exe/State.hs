module State where

newtype StateMonad s a = StateMonad { run :: s -> (a, s) }

getNewState :: (s -> (a, s)) -> StateMonad s a
getNewState f = StateMonad { run = f }

instance Functor (StateMonad s) where

  fmap f state = StateMonad $ \s -> let (a, s') = run state s in (f a, s');

instance Applicative (StateMonad s)

instance Monad (StateMonad s) where
  
  return a = StateMonad $ \state -> (a, state)

  state >>= f = StateMonad $ \s -> let (a, s') = run state s in run (f a) s'
