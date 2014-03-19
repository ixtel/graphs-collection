OUTPUT=./output

all: html pdf

html: $(OUTPUT)/tutorial.html

pdf: $(OUTPUT)/tutorial.pdf $(OUTPUT)/tutorial_beamer.pdf

$(OUTPUT)/tutorial.pdf: tutorial.md
	pandoc $< -o $@

$(OUTPUT)/tutorial_beamer.pdf: tutorial.md
	pandoc -t beamer -s $< -o $@

$(OUTPUT)/tutorial.html: tutorial.md
	pandoc -t slidy -s $< -o $@
