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

{ #category : #testing }
DTOCheckLive >> canBeDTOS: parameter [
	^ parameter declaredType isStub not
]

{ #category : #accessing }
DTOCheckLive >> dtosFromSuperClass [

	^ (model allModelClasses detect: [ :class | 
		 class name = 'BLLazyServerPojo' ]) subclassHierarchy reject: [ 
		:class | class name includesSubstring: 'Enum' ]
]

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

{ #category : #api }
DTOCheckLive >> serviceDTO: aFamixJavaMethod [

	aFamixJavaMethod isPublic ifFalse: [ ^ #(  ) ].
	^ ((self canBeDTOS: aFamixJavaMethod)
		   ifTrue: [ { aFamixJavaMethod declaredType } ]
		   ifFalse: [ #(  ) ])
		 , (aFamixJavaMethod parameters
		   select: [ :param | self canBeDTOS: param ]
		   thenCollect: [ :param | param declaredType ])
]

{ #category : #api }
DTOCheckLive >> services: aClass [

	"créer une méthode #services: qui recherche les méthodes d'une classe pouvant être des services (publique, pas constructeur, pas <Initializer>)"

	^ aClass methods select: [ :method | 
		  method isPublic and: [ 
			  method isConstructor not and: [ 
				  (method name ~= '<Initializer>') ] ] ]
]
