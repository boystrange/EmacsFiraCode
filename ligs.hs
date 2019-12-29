-- Copyright (c) 2019 Luca Padovani

-- Permission is hereby granted, free of charge, to any person
-- obtaining a copy of this software and associated documentation
-- files (the "Software"), to deal in the Software without
-- restriction, including without limitation the rights to use,
-- copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the
-- Software is furnished to do so, subject to the following
-- conditions:

-- The above copyright notice and this permission notice shall be
-- included in all copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
-- OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-- NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
-- HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
-- WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-- FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-- OTHER DEALINGS IN THE SOFTWARE.

import Data.Set (Set)
import qualified Data.Set as Set
import Data.Char (ord, chr)
import Data.List (nub, groupBy, intercalate, sort, partition)
import Control.Monad (forM_)

eqf :: String -> String -> Bool
eqf (c : _) (d : _) = c == d

split :: [String] -> [(Char, [String])]
split ws = pgs
  where
    ps :: [(Char, String)]
    ps = map (\(c : cs) -> (c, cs)) ws

    gps :: [[(Char, String)]]
    gps = groupBy (\(c, _) (d, _) -> c == d) ps

    pgs :: [(Char, [String])]
    pgs = map (\((c, cs) : qs) -> (c, (cs : map snd qs))) gps

shygroup :: String -> String
shygroup s = "\\\\(?:" ++ s ++ "\\\\)"

charset :: [String] -> String
charset ws = "[" ++ concat ws ++ "]"

maygroup :: [String] -> String
maygroup [s] = s
maygroup ws | null cs = charset ss
            | length ss <= 1 = shygroup (intercalate "\\\\|" ws)
            | otherwise = shygroup (charset ss ++ "\\\\|" ++ intercalate "\\\\|" cs)
  where
    (ss, cs) = partition simple ws

    simple [c] = not (c `elem` "-]^")
    simple _ = False

esc :: Char -> String
esc c | c `elem` ".*+?[^$" = ['\\', '\\', c]
esc c = [c]

regex :: [String] -> String
regex [] = ""
regex ws = maygroup (map aux (split ws))
  where
    aux :: (Char, [String]) -> String
    aux (c, [""]) = esc c
    aux (c, [s]) = esc c ++ regex [s]
    aux (c, vs) | any null vs = shygroup (esc c ++ regex (filter (not . null) vs) ++ "\\\\|" ++ esc c)
    aux (c, vs) = esc c ++ regex (filter (not . null) vs)

rhs :: [String] -> String
rhs ss = "." ++ shygroup (regex ss)

table :: [[String]] -> [(Int, String)]
table ligs = map aux ligs
  where
    aux ((c : cs) : ss) = (ord c, rhs (cs : map tail ss))

putEntry :: (Int, String) -> IO ()
putEntry (n, s) = putStrLn $ "  (" ++ show n ++ " . \"" ++ s ++ "\") ;; " ++ [chr n]

main :: IO ()
main = do
  s <- getContents
  let ligs = groupBy eqf (sort $ lines s)
  let tab = table ligs
  putStrLn "(let ((alist '("
  forM_ tab putEntry
  putStrLn "             )))\n\
           \  (dolist (char-regexp alist)\n\
           \    (set-char-table-range composition-function-table (car char-regexp)\n\
           \                          `([,(cdr char-regexp) 0 font-shape-gstring]))))"
