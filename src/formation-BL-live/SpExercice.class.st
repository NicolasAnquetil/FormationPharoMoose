Class {
	#name : #SpExercice,
	#superclass : #SpPresenter,
	#instVars : [
		'classLabel',
		'classInput',
		'okButton',
		'subClassLabel',
		'list',
		'model'
	],
	#category : #'formation-BL-live-Spec'
}

{ #category : #layout }
SpExercice class >> defaultLayout [

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
			add: #okButton ;
		  yourself) height: self toolbarHeight;
	add: #subClassLabel height: self toolbarHeight;
	add: #list;
	yourself.
]

{ #category : #initialization }
SpExercice >> connectPresenters [

	okButton action: [ self treatInputClass: classInput text.
			]

	
]

{ #category : #initialization }
SpExercice >> initializePresenter [

	super initializePresenter.
	classLabel := self newLabel.
	classLabel label: 'Classe'.
	classInput := self newTextInput.
	classInput text: 'BLLazyServerPojo'.
	okButton := self newButton.
	okButton label: 'OK'.
	subClassLabel := self newLabel.
	subClassLabel label: 'sous classes'.
	list := self newList.
	list display: [ :elt | elt name ]
]

{ #category : #accessing }
SpExercice >> model [

	^ model
]

{ #category : #accessing }
SpExercice >> model: anObject [

	model := anObject
]

{ #category : #'as yet unclassified' }
SpExercice >> treatInputClass: aString [

	| inputClass classList |
	inputClass := model allModelClasses
		              detect: [ :class | class name = aString ]
		              ifNone: [ self inform: 'Class not found' ].
	classList := inputClass subclassHierarchy.

	list items: classList.
]
