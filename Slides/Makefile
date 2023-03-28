
%.html : %.md
	npx marp $<

%.pdf : %.md
	npx marp --pdf $<

all: introPharo.html langagePharo.html execPharo.html idePharo.html moose.html famix.html mooseIDE.html

pdf: introPharo.pdf langagePharo.pdf execPharo.pdf idePharo.pdf moose.pdf famix.pdf mooseIDE.pdf

introPharo.html: Images/pharoSyntax.png

execPharo.html: Images/moosePlayground.png Images/transcript.png

mooseIDE.html: Images/mooseMenu.png Images/mooseArchi.png