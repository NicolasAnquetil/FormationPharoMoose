
%.html : %.md
	npx marp $<

%.pdf : %.md
	npx marp --pdf --allow-local-files $<

#dependencies to images

intro = 

exec = Images/moosePlayground.png Images/transcript.png

langage = Images/pharoSyntax.png

ide = Images/systemBrowser.png Images/testRunner.png Images/spotter.png Images/finder.png Images/epicea.png Images/profiler.png

# rules

all: introPharo.html langagePharo.html execPharo.html idePharo.html

pdf: introPharo.pdf langagePharo.pdf execPharo.pdf idePharo.pdf

introPharo.html: $(intro)

introPharo.pdf: $(intro)

execPharo.html: $(exec)

execPharo.pdf: $(exec)

langagePharo.html: $(exec)

langagePharo.pdf: $(exec)

idePharo.html: $(ide)

idePharo.pdf: $(ide)
