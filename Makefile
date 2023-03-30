
%.html :
	cd `basename $@ ".html"` ; make all

%.pdf :
	cd `basename $@ ".pdf"` ; make pdf

all: SlidesPharo.html SlidesMoose.html SlidesRoassal.html

pdf: SlidesPharo.pdf SlidesMoose.pdf SlidesRoassal.pdf