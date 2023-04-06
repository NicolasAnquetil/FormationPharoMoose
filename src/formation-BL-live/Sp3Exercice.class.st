Class {
	#name : #Sp3Exercice,
	#superclass : #SpPresenter,
	#instVars : [
		'classLabel',
		'classInput',
		'okButton',
		'subClassLabel',
		'model',
		'tree',
		'roas'
	],
	#category : #'formation-BL-live-Spec'
}

{ #category : #layout }
Sp3Exercice class >> defaultLayout [

	"	classLabel := self newLabel.
	classLabel label: 'Classe'.
	classInput := self newTextInput.
	okButton := self newButton.
	okButton label: 'OK'.
	subClassLabel := self newLabel.
	subClassLabel label: 'sous classes'.
	list := self newList"

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   add: #classLabel;
				   add: #classInput;
				   add: #okButton;
				   yourself)
		  height: self toolbarHeight;
		  add: #subClassLabel height: self toolbarHeight;
		  add: #tree;add: #roas;
		  yourself
]

{ #category : #initialization }
Sp3Exercice >> connectPresenters [

	okButton action: [ self treatInputClass: classInput text ].
	tree whenSelectedItemChangedDo: [ :class | self initRoas: class ]
]

{ #category : #'as yet unclassified' }
Sp3Exercice >> initRoas: pojo [

	| classes popup canvas |
	pojo ifNil: [ ^ self ].
	canvas := roas canvas.
	
	canvas nodes copy do: #remove.
	classes := pojo subclassHierarchy
		           add: pojo;
		           yourself.
	classes do: [ :c | 
		| box |
		box := RSBox new size: 50.
		box model: c.
		popup := RSPopup text: [ :class | 
			         class name , String crlf , 'number of methods: '
			         , class methods size asString ].
		box @ popup.
		box when: RSMouseClick do: [ :evt | c inspect ].
		canvas add: box ].

	RSLineBuilder verticalBezier
		withVerticalAttachPoint;
		canvas: canvas;
		connectFrom: [ :model1 | model1 superclass ].

	RSTreeLayout on: canvas nodes.
	canvas zoomToFit.
	canvas addInteraction: RSCanvasController
]

{ #category : #initialization }
Sp3Exercice >> initializePresenter [

	super initializePresenter.
	classLabel := self newLabel.
	classLabel label: 'Classe'.
	classInput := self newTextInput.
	classInput placeholder: 'enter a regex'.
	okButton := self newButton.
	okButton label: 'OK'.
	subClassLabel := self newLabel.
	subClassLabel label: 'sous classes'.
	tree := self newTree.
	tree roots: {  }.
	tree children: [ :aClass | aClass directSubclasses ].
	tree display: [ :elt | elt name ].
	roas := self newRoassal.
	roas canvas add: RSBox new
]

{ #category : #accessing }
Sp3Exercice >> model [

	^ model
]

{ #category : #accessing }
Sp3Exercice >> model: anObject [

	model := anObject
]

{ #category : #initialization }
Sp3Exercice >> title [

	^ 'Le truc de Benoit'
]

{ #category : #'as yet unclassified' }
Sp3Exercice >> treatInputClass: aString [

	| inputClass |
	inputClass := model allModelClasses
		              detect: [ :class | 
		              ('.*' , aString , '.*') asRegex matches: class name ]
		              ifNone: [ self inform: 'Class not found'. ^ self. ].


	tree roots: { inputClass }.
	self initRoas: inputClass.
	roas canvas signalUpdate
]
