
%.html : %.md
	npx marp $<

%.pdf : %.md
	npx marp --pdf --allow-local-files $<

#dependencies to images

roassal = images/systemcpx.png images/rscanvasempty.png images/rsbox.png images/rscircle.png \
    images/rsboxredmodified.png images/rscanvas.png images/horizontalLayout.png images/rsline.png \
	images/rslineborder.png images/rslineborder.png images/treeclasses.png images/systemcpx.png

# rules

all: RS3.html

pdf: RS3.pdf

RS3.html: $(roassal)

RS3.pdf: $(roassal)
