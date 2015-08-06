TEX_SOURCES=Thesis.tex Chapters/*.tex classicthesis-config.tex FrontBackMatter/*.tex
TEX_CMD=pdflatex
all: $(TEX_SOURCES)
	pdflatex "Thesis.tex";
	open "Thesis.pdf"

clean:
	rm *.aux *.log Chapters/*.aux Chapters/*.log FrontBackMatter/*.aux FrontBackMatter/*.log
