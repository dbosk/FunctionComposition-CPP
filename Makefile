.PHONY: all
all: FunctionComposition.pdf FunctionComposition

FunctionComposition.pdf: FunctionComposition.tex
	latexmk -pdf $^

FunctionComposition.tex: FunctionComposition.nw
	noweave $^ -t2 > $@

FunctionComposition.cpp: FunctionComposition.nw
	notangle -RFunctionComposition.cpp -L'#line %L "%F"%N' $^ > $@

FunctionComposition: FunctionComposition.cpp
	clang++ -g -std=c++11 -Wall -Wextra -Werror -o $@ $^

.PHONY: clean
clean:
	${RM} FunctionComposition.tex FunctionComposition.pdf
	${RM} FunctionComposition.cpp FunctionComposition
