
%.html : %.md
	npx marp $<

%.pdf : %.md
	npx marp --pdf $<

all: introPharo.html langagePharo.html execPharo.html

pdf: introPharo.pdf langagePharo.pdf execPharo.pdf

introPharo.html: Images/pharoSyntax.png

execPharo.html: Images/moosePlayground.png Images/transcript.png

