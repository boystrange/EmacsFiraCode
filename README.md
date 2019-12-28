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
2. Replace the composition table with the one in [ligs.out](ligs.out).
3. Restart Emacs, open the file `ligs.txt` and check whether the
   ligatures show up correctly.

## Custom setup

In case you want to add new ligatures or remove unwanted ones:

1. Update [ligs.in](ligs.in) by removing the lines with the unwanted
   ligatures or by adding new ones.
2. Make sure you have GHC installed and run `make` to compile [ligs.hs](ligs.hs)
   and obtain the updated composition table:
   ``` bash
   make
   ```
3. Replace the composition table in your `.emacs` file as described
   in the previous section.

## What is missing

* Ligature for hex literals (this has to be added manually)
* Possibly more...
