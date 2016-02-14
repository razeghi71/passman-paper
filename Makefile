TEX = pdflatex -shell-escape -interaction=nonstopmode -file-line-error
BIB = bibtex

.PHONY: all view

all : main.pdf

main.pdf : main.tex refs.bbl
	$(TEX) main.tex

refs.bbl : refs.bib main.aux
	$(BIB) main

main.aux : main.tex
	$(TEX) main.tex

main.bib : refs.tex
	$(TEX) refs.tex

clean:
	rm -rf *.aux *.bbl *.log *.toc *.blg *.pdf
