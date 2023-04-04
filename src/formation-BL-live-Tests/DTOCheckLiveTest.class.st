"
A DTOCheckLiveTest is a test class for testing the behavior of DTOCheckLive
"
Class {
	#name : #DTOCheckLiveTest,
	#superclass : #TestCase,
	#instVars : [
		'checker',
		'model'
	],
	#category : #'formation-BL-live-Tests'
}

{ #category : #running }
DTOCheckLiveTest >> entity: famixClass named: aString [
	^famixClass new
		name: aString ;
		mooseModel: model ;
		yourself
]

{ #category : #running }
DTOCheckLiveTest >> setUp [
  super setUp.
	
  model := FamixJavaModel new.
  checker := DTOCheckLive new model: model ; yourself
]

{ #category : #tests }
DTOCheckLiveTest >> testRegexTypes [
	
	self entity: FamixJavaClass named: 'babayaga'.
	self entity: FamixJavaClass named: 'baby'.

	self assert: (checker regexpTypes: 'baby') size equals: 1.
	
	

]
