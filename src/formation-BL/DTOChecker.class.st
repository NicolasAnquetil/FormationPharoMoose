"
This class is used to check some desirable properties on Omaje's DTOs
Used only for training
"
Class {
	#name : #DTOChecker,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'formation-BL'
}

{ #category : #api }
DTOChecker >> dtosFromSuperClass [
	| rootclass |
	(self regexpTypes: 'BLLazyServerPojo')
	ifEmpty: [ ^#() ]
	ifNotEmpty: [ :types |
		types ifEmpty: [ ^#() ].
		rootclass := types anyOne
	].

	^rootclass subclassHierarchy
		reject: [ :candidate |
			candidate isAbstract or:
			[ candidate name asLowercase includesSubstring: 'enum' ] ]
]

{ #category : #accessing }
DTOChecker >> model [

	^ model
]

{ #category : #accessing }
DTOChecker >> model: anObject [

	model := anObject
]

{ #category : #search }
DTOChecker >> regexpTypes: regexp [
	^model allTypes select: [ :typ | regexp asRegex matches: typ name ]
]
