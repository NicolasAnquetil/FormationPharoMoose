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

{ #category : #testing }
DTOChecker >> canBeDTO: aFamixClass [
	aFamixClass ifNil: [ ^false ].
	
	^aFamixClass isStub not
]

{ #category : #api }
DTOChecker >> dtosFromServices [
	^(self regexpTypes: 'Uc.*') flatCollectAsSet: [ :uc | (self services: uc) flatCollect: [:s | self serviceDTO: s ] ]
]

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
		reject: [ :candidate | candidate name asLowercase includesSubstring: 'enum' ]
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

{ #category : #api }
DTOChecker >> serviceDTO:  aFamixMethod [

	^({ aFamixMethod declaredType } , (aFamixMethod parameters collect: #declaredType))
		select: [ :candidate | self canBeDTO: candidate ]

]

{ #category : #api }
DTOChecker >> services: aFamixClass [ 
	^aFamixClass methods reject: [ :m |
		m isPublic not or:
		[ m name = '<Initializer>' or:
		[ m isConstructor ] ]
	]
]
