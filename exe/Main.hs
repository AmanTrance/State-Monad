module Main where

import State

main :: IO ()
main = do
  print $ run (getNewState (\s -> ((), s)) >>
    StateMonad { run = \s -> (True, s + 200)} >>
      StateMonad { run = \s -> ("Done", s * 20) } >>
        StateMonad { run = \s -> ("Once":[ "More" ], s / 2) }) 2
