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

{ #category : #test }
DTOCheckLiveTest >> testCanBeDTOS [

	| famixParameter |
	famixParameter := self entity: FamixJavaParameter named: 'aParam'.
	self deny: (checker canBeDTOS: famixParameter)
]

{ #category : #test }
DTOCheckLiveTest >> testDtosFromServices [

	| famixClass ucFamixClass famixMethod ucFamixMethod famixParam ucFamixParam |
	famixClass := self entity: FamixJavaClass named: 'FamixJavaClass'.
	ucFamixClass := self entity: FamixJavaClass named: 'UcFamixJavaClass'.

	famixMethod := self entity: FamixJavaMethod named: 'famixJavaMethod'.
	ucFamixMethod := self
		                 entity: FamixJavaMethod
		                 named: 'ucFamixJavaMethod'.
	ucFamixClass addMethod: ucFamixMethod.
	ucFamixMethod isPublic: true.

	famixParam := self entity: FamixJavaParameter named: 'myFirstParam'.

	famixParam parentBehaviouralEntity: famixMethod.
	famixParam declaredType: famixClass.

	ucFamixParam := self
		                entity: FamixJavaParameter
		                named: 'ucMyFirstParam'.

	ucFamixParam parentBehaviouralEntity: ucFamixMethod.
	ucFamixParam declaredType: famixClass.


	self assert: checker dtosFromServices size equals: 1.
	self assert: checker dtosFromServices anyOne equals: famixClass
]

{ #category : #tests }
DTOCheckLiveTest >> testDtosFromSuperclass [
	| childClass parentClass |
	parentClass:=self entity: FamixJavaClass named: 'BLLazyServerPojo'.
	childClass:=self entity: FamixJavaClass named: 'BLLazyServerPojoChild'.
	
	parentClass addSubInheritance: (FamixJavaInheritance new subclass: childClass; yourself).
	
	self assert: (checker dtosFromSuperClass) size equals:1. 
	
   
]

{ #category : #test }
DTOCheckLiveTest >> testMultipleTimesTheSameDtosFromServices [

	| famixClass ucFamixClass uc2FamixClass famixMethod ucFamixMethod famixParam ucFamixParam uc2FamixMethod uc2FamixParam |
	famixClass := self entity: FamixJavaClass named: 'FamixJavaClass'.
	ucFamixClass := self entity: FamixJavaClass named: 'UcFamixJavaClass'.

	uc2FamixClass := self
		                 entity: FamixJavaClass
		                 named: 'Uc2FamixJavaClass'.

	famixMethod := self entity: FamixJavaMethod named: 'famixJavaMethod'.
	ucFamixMethod := self
		                 entity: FamixJavaMethod
		                 named: 'ucFamixJavaMethod'.
	ucFamixClass addMethod: ucFamixMethod.
	ucFamixMethod isPublic: true.

	uc2FamixMethod := self
		                  entity: FamixJavaMethod
		                  named: 'uc2FamixJavaMethod'.
	uc2FamixClass addMethod: uc2FamixMethod.
	uc2FamixMethod isPublic: true.


	famixParam := self entity: FamixJavaParameter named: 'myFirstParam'.

	famixParam parentBehaviouralEntity: famixMethod.
	famixParam declaredType: famixClass.

	ucFamixParam := self
		                entity: FamixJavaParameter
		                named: 'ucMyFirstParam'.

	ucFamixParam parentBehaviouralEntity: ucFamixMethod.
	ucFamixParam declaredType: famixClass.

	uc2FamixParam := self
		                 entity: FamixJavaParameter
		                 named: 'ucMyFirstParam'.

	uc2FamixParam parentBehaviouralEntity: uc2FamixMethod.
	uc2FamixParam declaredType: famixClass.
	self assert: checker dtosFromServices size equals: 1.
	self
		assertCollection: checker dtosFromServices
		hasSameElements: { famixClass }
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
	famixMethod isPublic: true.
	famixParam := self entity: FamixJavaParameter named: 'myFirstParam'.

	famixParam parentBehaviouralEntity: famixMethod.
	famixParam declaredType: famixClass.

	self assert: (checker serviceDTO: famixMethod) size equals: 1
]

{ #category : #tests }
DTOCheckLiveTest >> testServices [

	| famixClass famixMethod famixParam |
	famixClass := self entity: FamixJavaClass named: 'famixJavaClass'.
	famixMethod := (self entity: FamixJavaMethod named: 'famixJavaMethod')
		               parentType: famixClass;
		               isPublic: true;
		               yourself.


	self assert: (checker services: famixClass) size equals: 1
]
