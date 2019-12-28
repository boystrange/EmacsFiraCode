# EmacsFiraCode

## What

This is a small Haskell program that creates the Emacs composition
table for the Fira Code font. The original composition table was
created (by hand, I suppose) by [Sean
Farley](https://github.com/seanfarley) and extended by [Jason
Blevins](https://github.com/jrblevin).

## Easy setup

For those who want to enable (almost) all the ligatures:

1. Refer to the workaround described
   [here](https://github.com/tonsky/FiraCode/wiki/Emacs-instructions#using-composition-char-table)

2. Replace the composition table with the following one

``` elisp
(33 . ".\\(?:\\(?:!\\|==\\|=\\)\\)") ;; !
(35 . ".\\(?:\\(?:!\\|###\\|#\\|#\\|(\\|:\\|=\\|\\?\\|\\[\\|_(\\|_\\|{\\)\\)") ;; #
(36 . ".\\(?:>\\)") ;; $
(37 . ".\\(?:%\\)") ;; %
(38 . ".\\(?:&\\)") ;; &
(42 . ".\\(?:\\(?:\\*\\*\\|\\*\\|/\\|>\\)\\)") ;; *
(43 . ".\\(?:\\(?:\\+\\+\\|\\+\\|>\\)\\)") ;; +
(45 . ".\\(?:\\(?:-\\(?:-\\|>\\)\\|-\\|<<\\|<\\|>>\\|>\\||\\|~\\)\\)") ;; -
(46 . ".\\(?:\\(?:-\\|\\.\\(?:\\.\\|<\\)\\|\\.\\|=\\)\\)") ;; .
(47 . ".\\(?:\\(?:\\*\\|//\\|/\\|==\\|=\\|>\\|\\\)\\)") ;; /
(58 . ".\\(?:\\(?:::\\|:\\|<\\|=\\|>\\)\\)") ;; :
(59 . ".\\(?:;\\)") ;; ;
(60 . ".\\(?:\\(?:!--\\|\\$>\\|\\$\\|\\*>\\|\\*\\|\\+>\\|\\+\\|-\\(?:-\\|<\\|>\\||\\)\\|-\\|/>\\|/\\|:\\|<\\(?:-\\|<\\|=\\)\\|<\\|=\\(?:<\\|=>\\|=\\|>\\||\\)\\|=\\|>\\||\\(?:>\\|||\\||\\)\\||\\|~\\(?:>\\|~\\)\\|~\\)\\)") ;; <
(61 . ".\\(?:\\(?:!=\\|/=\\|:=\\|<<\\|=\\(?:=\\|>\\)\\|=\\|>>\\|>\\)\\)") ;; =
(62 . ".\\(?:\\(?:->\\|-\\|:\\|=>\\|=\\|>\\(?:-\\|=\\|>\\)\\|>\\)\\)") ;; >
(63 . ".\\(?:\\(?:\\.\\|:\\|=\\|\\?\\)\\)") ;; ?
(70 . ".\\(?:l\\)") ;; F
(84 . ".\\(?:l\\)") ;; T
(91 . ".\\(?:\\(?::]\\||\\)\\)") ;; [
(92 . ".\\(?:\\(?:/\\|\\\|n\\)\\)") ;; \
(94 . ".\\(?:=\\)") ;; ^
(95 . ".\\(?:\\(?:_\\||_\\)\\)") ;; _
(102 . ".\\(?:l\\)") ;; f
(119 . ".\\(?:ww\\)") ;; w
(123 . ".\\(?:|\\)") ;; {
(124 . ".\\(?:\\(?:->\\|-\\|=>\\|=\\|>\\|]\\||\\(?:-\\|=\\|>\\||>\\)\\||\\|}\\)\\)") ;; |
(126 . ".\\(?:\\(?:-\\|=\\|>\\|@\\|~>\\|~\\)\\)") ;; ~
```

3. Open the file `ligs.txt` and check whether the ligatures show up
   correctly.

## Custom setup

In case you want to add new ligatures or remove unwanted ones:

1. Update the file `ligs.txt` by removing the lines with the
   unwanted ligatures or adding new ones.
2. Compile `ligs.hs` with GHC:
   ``` bash
   ghc ligs.hs
   ```
3. Run `ligs`:
   ``` bash
   ./ligs
   ```
4. Replace the composition table in your `.emacs` file as described
   in the previous section.
