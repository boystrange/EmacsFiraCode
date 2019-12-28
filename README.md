# EmacsFiraCode

## What it is

This is a small Haskell program that automatically generates the
Emacs composition table for the [Fira
Code](https://github.com/tonsky/FiraCode) font. The original
composition table was handcrafted by [Sean
Farley](https://github.com/seanfarley) and extended by [Jason
Blevins](https://github.com/jrblevin).

## Easy setup

For those who want to enable (almost) all the ligatures:

1. Refer to the workaround described
   [here](https://github.com/tonsky/FiraCode/wiki/Emacs-instructions#using-composition-char-table).
2. Replace the composition table with the following one:
   ``` elisp
   (33 . ".\\(?:\\(?:!\\|==\\|=\\)\\)") ;; !
   (35 . ".\\(?:\\(?:[!(:={]\\|###\\|#\\|#\\|\\?\\|\\[\\|_(\\|_\\)\\)") ;; #
   (36 . ".\\(?:>\\)") ;; $
   (37 . ".\\(?:%\\)") ;; %
   (38 . ".\\(?:&\\)") ;; &
   (42 . ".\\(?:\\(?:[/>]\\|\\*\\*\\|\\*\\)\\)") ;; *
   (43 . ".\\(?:\\(?:\\+\\+\\|\\+\\|>\\)\\)") ;; +
   (45 . ".\\(?:\\(?:[|~]\\|-\\(?:-\\|>\\)\\|-\\|<<\\|<\\|>>\\|>\\)\\)") ;; -
   (46 . ".\\(?:\\(?:-\\|\\.\\(?:\\.\\|<\\)\\|\\.\\|=\\)\\)") ;; .
   (47 . ".\\(?:\\(?:[>\]\\|\\*\\|//\\|/\\|==\\|=\\)\\)") ;; /
   (58 . ".\\(?:\\(?:[<=>]\\|::\\|:\\)\\)") ;; :
   (59 . ".\\(?:;\\)") ;; ;
   (60 . ".\\(?:\\(?:[:>]\\|!--\\|\\$>\\|\\$\\|\\*>\\|\\*\\|\\+>\\|\\+\\|-\\(?:[<>|]\\|-\\)\\|-\\|/>\\|/\\|<\\(?:[<=]\\|-\\)\\|<\\|=\\(?:[<>|]\\|=>\\|=\\)\\|=\\||\\(?:>\\|||\\||\\)\\||\\|~[>~]\\|~\\)\\)") ;; <
   (61 . ".\\(?:\\(?:!=\\|/=\\|:=\\|<<\\|=[=>]\\|=\\|>>\\|>\\)\\)") ;; =
   (62 . ".\\(?:\\(?:->\\|-\\|:\\|=>\\|=\\|>\\(?:[=>]\\|-\\)\\|>\\)\\)") ;; >
   (63 . ".\\(?:\\(?:[:=]\\|\\.\\|\\?\\)\\)") ;; ?
   (70 . ".\\(?:l\\)") ;; F
   (84 . ".\\(?:l\\)") ;; T
   (91 . ".\\(?:\\(?::]\\||\\)\\)") ;; [
   (92 . ".\\(?:[/\n]\\)") ;; \
   (94 . ".\\(?:=\\)") ;; ^
   (95 . ".\\(?:\\(?:_\\||_\\)\\)") ;; _
   (102 . ".\\(?:l\\)") ;; f
   (119 . ".\\(?:ww\\)") ;; w
   (123 . ".\\(?:|\\)") ;; {
   (124 . ".\\(?:\\(?:[>}]\\|->\\|-\\|=>\\|=\\|]\\||\\(?:[=>]\\|-\\||>\\)\\||\\)\\)") ;; |
   (126 . ".\\(?:\\(?:[=>@]\\|-\\|~>\\|~\\)\\)") ;; ~
   ```
3. Restart Emacs and open the file `ligs.txt` and check whether the
   ligatures show up correctly.

## Custom setup

In case you want to add new ligatures or remove unwanted ones:

1. Update the file `ligs.txt` by removing the lines with the
   unwanted ligatures or by adding new ones.
2. Compile `ligs.hs` with GHC:
   ``` bash
   ghc ligs.hs
   ```
3. Run `ligs` to obtain the updated composition table:
   ``` bash
   ./ligs
   ```
4. Replace the composition table in your `.emacs` file as described
   in the previous section.

## What is missing

* Ligature for hex literals (this has to be added manually)
* Possibly more...
