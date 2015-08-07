TEX_SOURCES=Thesis.tex Chapters/*.tex classicthesis-config.tex FrontBackMatter/*.tex
TEX_CMD=pdflatex
all: $(TEX_SOURCES)
	pdflatex "Thesis.tex";
	bibtex "Thesis";
	pdflatex "Thesis.tex";
	pdflatex "Thesis.tex";
	open "Thesis.pdf"

clean:
	$(RM) *.aux *.log Chapters/*.aux Chapters/*.log FrontBackMatter/*.aux FrontBackMatter/*.log *.toc *.bbl *.blg *.out
