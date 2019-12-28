
NAME = ligs

ligs.out: ligs.in $(NAME)
	./$(NAME) <ligs.in >$@

$(NAME): ligs.hs
	ghc $<

.PHONY: clean
clean:
	rm $(NAME)
