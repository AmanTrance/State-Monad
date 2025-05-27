module Main where

import State

main :: IO ()
main = do
  print $ run (getNewState (\s -> ((), s)) >>= (\() -> StateMonad { run = \s -> (True, s + 200)})) 1
