
%.html : %.md
	npx marp $<

%.pdf : %.md
	npx marp --pdf --allow-local-files $<

all: moose.html famix.html mooseIDE.html

pdf: moose.pdf famix.pdf mooseIDE.pdf

mooseIDE.html: Images/mooseMenu.png Images/mooseArchi.png
