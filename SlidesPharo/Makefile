
%.html : %.md
	npx marp $<

%.pdf : %.md
	npx marp --pdf --allow-local-files $<

#dependencies to images

intro = 

exec = Images/moosePlayground.png Images/transcript.png

langage = Images/pharoSyntax.png

ide = Images/systemBrowser.png Images/testRunner.png Images/spotter.png Images/finder.png Images/epicea.png Images/profiler.png

spec = Images/mvp.png Images/defaultLayout.svg Images/initializepresenters.svg Images/connectPresenters.svg \
    Images/setmodel.svg

# rules

all: introPharo.html langagePharo.html execPharo.html idePharo.html spec.html

pdf: introPharo.pdf langagePharo.pdf execPharo.pdf idePharo.pdf spec.pdf

introPharo.html: $(intro)

introPharo.pdf: $(intro)

execPharo.html: $(exec)

execPharo.pdf: $(exec)

langagePharo.html: $(langage)

langagePharo.pdf: $(langage)

idePharo.html: $(ide)

idePharo.pdf: $(ide)

spec.html: $(spec)

spec.pdf: $(spec)
