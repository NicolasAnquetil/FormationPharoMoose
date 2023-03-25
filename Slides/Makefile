
%.html : %.md
	npx marp $<

%.pdf : %.md
	npx marp --pdf $<

all: introPharo.html langagePharo.html execPharo.html idePharo.html

pdf: introPharo.pdf langagePharo.pdf execPharo.pdf idePharo.pdf

introPharo.html: Images/pharoSyntax.png

execPharo.html: Images/moosePlayground.png Images/transcript.png

