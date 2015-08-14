TEX_SOURCES=Thesis.tex Chapters/*.tex classicthesis-config.tex FrontBackMatter/*.tex
TEX_CMD=pdflatex
all: $(TEX_SOURCES)
	$(TEX_CMD) "Thesis.tex";
	bibtex "Thesis";
	$(TEX_CMD) "Thesis.tex";
	$(TEX_CMD) "Thesis.tex";
	open -g -a Skim "Thesis.pdf"

once: $(TEX_SOURCES)
	$(TEX_CMD) "Thesis.tex";
	open -g -a Skim "Thesis.pdf"

clean:
	$(RM) *.aux *.log Chapters/*.aux Chapters/*.log FrontBackMatter/*.aux FrontBackMatter/*.log gfx/*aux gfx/*.log *.toc *.bbl *.blg *.out

%.pdf: gfx/%.tex
	$(TEX_CMD) -jobname $(basename $@) -output-directory gfx '\documentclass{standalone} \usepackage[dvipsnames]{xcolor} \usepackage{tikz} \begin{document} \input{' $< '} \end{document}';
	open -g -a Skim gfx/$*.pdf
