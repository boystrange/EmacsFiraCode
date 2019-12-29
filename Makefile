
NAME = ligs

fira-code-ligatures.el: ligatures.txt $(NAME)
	./$(NAME) <$< >$@

$(NAME): ligs.hs
	ghc $<

.PHONY: clean
clean:
	rm $(NAME)
