
%.html : %.md
	npx marp $<

%.pdf : %.md
	npx marp --pdf --allow-local-files $<

#dependencies to images

intro = Images/mooseOverview.png

mooseIDE = Images/mooseMenu.png Images/mooseArchi.png Images/mooseToolHeader.png

# rules

all: moose.html famix.html mooseIDE.html

pdf: moose.pdf famix.pdf mooseIDE.pdf

moose.html: $(intro)

moose.pdf: $(intro)

mooseIDE.html: $(mooseIDE)

mooseIDE.pdf: $(mooseIDE)
