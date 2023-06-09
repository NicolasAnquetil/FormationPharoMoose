Class {
	#name : #MySystemComplexity,
	#superclass : #Object,
	#category : #'formation-BL'
}

{ #category : #examples }
MySystemComplexity >> example [

	"The variable classes contains the classes we would like to visualize"

	| classes c |
	classes := SequenceableCollection withAllSubclasses.

	"A canvas is a container of graphical shapes"
	c := RSCanvas new.

	"Each class is represented as a box"
	classes do: [ :aClass | c add: (RSBox new model: aClass) ].

	"The width of each class indicates the number of variables defined in the class"
	RSNormalizer width
		shapes: c shapes;
		from: 6;
		to: 20;
		normalize: #numberOfVariables.

	"Height of each class represents the number of methods"
	RSNormalizer height
		shapes: c shapes;
		normalize: #numberOfMethods.

	"A class color goes from gray to red, indicating the number of lines of code"
	RSNormalizer color
		shapes: c shapes;
		from: Color gray;
		to: Color red;
		normalize: #numberOfLinesOfCode.

	"Vertical lines indicate the inheritance relationship"
	RSLineBuilder verticalBezier
		canvas: c;
		withVerticalAttachPoint;
		color: Color lightGray;
		connectFrom: #superclass.

	"Use a tree layout to adequately locate the classes"
	RSTreeLayout on: c nodes.

	"We make all the classes draggable and with a contextual popup window"
	c nodes
		@ RSDraggable;
		@ (RSPopup text: [ :s | 
					 s name , String cr , 'Number of lines of code: '
					 , s numberOfLinesOfCode asString ]);
		@ RSHighlightable green.

	"The whole visualization is zoomable, draggable, and shapes may be searched in it"
	c @ RSCanvasController.
	^ c
]
