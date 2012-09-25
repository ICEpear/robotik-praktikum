all:
	pdflatex doku.tex 
	#bibtex doku
	pdflatex doku.tex 
	pdflatex doku.tex 

show: all
	evince doku.pdf

complete: clean sdx all

sdx:
ifeq ($(shell uname),Linux)
	@./sdxmake.sh
endif

clean:
	rm -rf temp
	find . -name \*.pdf -exec rm {} \;
	find . -name \*.brf -exec rm {} \;
	find . -name \*.aux -exec rm {} \;
	find . -name \*.idx -exec rm {} \;
	find . -name \*.glg -exec rm {} \;
	find . -name \*.glo -exec rm {} \;
	find . -name \*.gls -exec rm {} \;
	find . -name \*.ist -exec rm {} \;
	find . -name \*.log -exec rm {} \;
	find . -name \*.out -exec rm {} \;
	find . -name \*.toc -exec rm {} \;
	find . -name \*.lof -exec rm {} \;
	find . -name \*.lot -exec rm {} \;
	find . -name \*.bbl -exec rm {} \;
	find . -name \*.blg -exec rm {} \;
	find . -name \*.dvi -exec rm {} \;
	find . -name \*~ -exec rm {} \;
	$(shell cd uml/sqd; rm -rf *.svg)
