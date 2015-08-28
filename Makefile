TEX_SOURCES=Thesis.tex Chapters/*.tex classicthesis-config.tex FrontBackMatter/*.tex
TEX_CMD=pdflatex -shell-escape

all: $(TEX_SOURCES) compile_title
	$(TEX_CMD) "Thesis.tex";
	bibtex "Thesis";
	$(TEX_CMD) "Thesis.tex";
	open -g -a Skim "Thesis.pdf"

once: $(TEX_SOURCES)
	$(TEX_CMD) "Thesis.tex";
	open -g -a Skim "Thesis.pdf"

compile_title: FrontBackMatter/Titlepage.tex
	cd FrontBackMatter; $(TEX_CMD) Titlepage.tex; cd ..; 
	
title: compile_title
	open -g -a Skim FrontBackMatter/Titlepage.pdf

clean:
	$(RM) *.aux *.log Chapters/*.aux Chapters/*.log FrontBackMatter/*.aux FrontBackMatter/*.log gfx/*aux gfx/*.log *.toc *.bbl *.blg *.out gfx/*figure*.pdf gfx/*.dpth gfx/*.md5

%.pdf: gfx/%.tex
	$(TEX_CMD) -jobname $(basename $@) -output-directory gfx '\documentclass{standalone} \usepackage[dvipsnames]{xcolor} \usepackage{tikz,pgfplots} \begin{document} \input{' $< '} \end{document}';
	open -g -a Skim gfx/$*.pdf
