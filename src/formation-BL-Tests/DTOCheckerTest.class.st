"
A DTOCheckerTest is a test class for testing the behavior of DTOChecker
"
Class {
	#name : #DTOCheckerTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'checker'
	],
	#category : #'formation-BL-Tests'
}

{ #category : #running }
DTOCheckerTest >> entity: famixClass named: aString [
	^famixClass new
		name: aString ;
		mooseModel: model ;
		yourself
]

{ #category : #running }
DTOCheckerTest >> setUp [
	super setUp.
	
	model := FamixJavaModel new.
	checker := DTOChecker new model: model ; yourself
]

{ #category : #tests }
DTOCheckerTest >> testModelSetter [
	self assert: checker model equals: model
]

{ #category : #tests }
DTOCheckerTest >> testRegexpTypes [
	| class |
	class := self entity: FamixJavaClass named: 'Babayaga'.

	self assert: (checker regexpTypes: '.*aya.*') size equals: 1.
	self assert: (checker regexpTypes: '.*aya.*') first equals: class
]

{ #category : #tests }
DTOCheckerTest >> testRegexpTypesNoMatch [
	| class |
	class := self entity: FamixJavaClass named: 'Babayaga'.

	self assert: (checker regexpTypes: '.*baby.*') size equals: 0
]

{ #category : #tests }
DTOCheckerTest >> testRegexpTypesSeveral [
	| class |
	self entity: FamixJavaClass named: 'Babayaga'.
	self entity: FamixJavaClass named: 'Maracuja'.
	self entity: FamixJavaClass named: 'Rastafa'.
	class := self entity: FamixJavaClass named: 'Marijuanna'.

	self assert: (checker regexpTypes: '.*a.a.*') size equals: 3.
	self deny: ((checker regexpTypes: '.*a.a.*') includes: class)
]
