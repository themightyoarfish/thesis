TEX_SOURCES=Thesis.tex Chapters/*.tex classicthesis-config.tex FrontBackMatter/*.tex
TEX_CMD=pdflatex -shell-escape
SPEED_FLAGS=-draftmode --interaction=batchmode 

all: Thesis.pdf

Thesis.pdf: $(TEX_SOURCES) FrontBackMatter/Titlepage.pdf
	$(TEX_CMD) -draftmode "Thesis.tex";
	bibtex "Thesis";
	$(TEX_CMD) $(SPEED_FLAGS) "Thesis.tex" > /dev/null 2>&1;
	$(TEX_CMD) --interaction=batchmode "Thesis.tex" > /dev/null 2>&1;
	open -g -a Skim "Thesis.pdf"

once: $(TEX_SOURCES) FrontBackMatter/Titlepage.pdf
	$(TEX_CMD) "Thesis.tex";
	open -g -a Skim "Thesis.pdf"

FrontBackMatter/Titlepage.pdf: FrontBackMatter/Titlepage.tex
	cd FrontBackMatter; $(TEX_CMD) Titlepage.tex; cd ..; 

clean:
	$(RM) Thesis.pdf *.aux *.log Chapters/*.aux Chapters/*.log FrontBackMatter/*.aux FrontBackMatter/*.log gfx/*.aux gfx/*.log *.toc *.bbl *.blg *.out gfx/autogen/*

%.pdf: gfx/%.tex
	$(TEX_CMD) -jobname $(basename $@) -output-directory gfx '\documentclass{standalone} \usepackage[dvipsnames]{xcolor} \usepackage{tikz,pgfplots} \begin{document} \input{' $< '} \end{document}';
	open -g -a Skim gfx/$*.pdf
