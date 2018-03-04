.PHONY: compile
compile: clean
	texi2pdf diplomski.tex

.PHONY: clean
clean:
	rm -f *.toc *.pdf *.log *.blg *.aux *.bbl

