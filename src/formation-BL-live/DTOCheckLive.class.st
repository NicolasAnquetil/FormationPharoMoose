"
A class for training purpose at BL pharo/moose formation.
"
Class {
	#name : #DTOCheckLive,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'formation-BL-live'
}

{ #category : #accessing }
DTOCheckLive >> model [

	^ model
]

{ #category : #accessing }
DTOCheckLive >> model: anObject [

	model := anObject
]

{ #category : #accessing }
DTOCheckLive >> regexpTypes: aString [ 
   |newRegex|
	newRegex := '.*',aString,'.*'.
	^ model allModelClasses select: [ :class | newRegex asRegex matches: class name ].
	

]
