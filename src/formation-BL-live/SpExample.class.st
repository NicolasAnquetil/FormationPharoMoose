Class {
	#name : #SpExample,
	#superclass : #SpPresenter,
	#instVars : [
		'button'
	],
	#category : #'formation-BL-live-Spec'
}

{ #category : #layout }
SpExample class >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: #button;
		  yourself
]

{ #category : #initialization }
SpExample >> connectPresenters [

	button action: [ 
		self inform: 'Benoît a été cliqué'.
		
	]
]

{ #category : #initialization }
SpExample >> initializePresenter [

	super initializePresenter.
	button := self newButton.
	button label: 'Clique Benoît'
]
