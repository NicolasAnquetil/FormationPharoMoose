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
DTOCheckLiveTest >> testDtosFromSuperclass [
	| childClass parentClass |
	parentClass:=self entity: FamixJavaClass named: 'BLLazyServerPojo'.
	childClass:=self entity: FamixJavaClass named: 'BLLazyServerPojoChild'.
	
	parentClass addSubInheritance: (FamixJavaInheritance new subclass: childClass; yourself).
	
	self assert: (checker dtosFromSuperClass) size equals:1. 
	
   
]

{ #category : #tests }
DTOCheckLiveTest >> testRegexTypes [
	
	self entity: FamixJavaClass named: 'babayaga'.
	self entity: FamixJavaClass named: 'baby'.

	self assert: (checker regexpTypes: 'baby') size equals: 1.
	
	

]

{ #category : #tests }
DTOCheckLiveTest >> testRegexTypesPartialRegex [
	
	self entity: FamixJavaClass named: 'babayaga'.
	self entity: FamixJavaClass named: 'baby'.

	self assert: (checker regexpTypes: 'bay') size equals: 1.
	self assert: (checker regexpTypes: 'bay') anyOne name equals: 'babayaga'.
	
	

]

{ #category : #tests }
DTOCheckLiveTest >> testServiceDTO [

	| famixClass famixMethod famixParam |
	famixClass := self entity: FamixJavaClass named: 'famixJavaClass'.
	famixMethod := self entity: FamixJavaMethod named: 'famixJavaMethod'.
	famixParam := self entity: FamixJavaParameter named: 'myFirstParam'.

	famixParam parentBehaviouralEntity: famixMethod.
	famixParam declaredType: famixClass.

	self assert: (checker serviceDTO: famixMethod) size equals: 1
]
