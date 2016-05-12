#!/usr/bin/runhaskell

import Network.CGI
import Data.Maybe

cgiMain :: CGI CGIResult


cgiMain = do
	  s <- getInput "q"
	  r <- formDecode getBody $ ("f")
	  -- output $ (fromMaybe "no" s) ++ "\n"
	  output $ r

main :: IO ()
main = runCGI (handleErrors cgiMain)
