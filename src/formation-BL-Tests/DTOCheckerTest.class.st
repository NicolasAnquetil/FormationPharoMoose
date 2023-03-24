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
DTOCheckerTest >> testCanBeDTO [

	| class |
	class := self entity: FamixJavaClass named: 'A_DTO'.

	self assert: (checker canBeDTO: class)
]

{ #category : #tests }
DTOCheckerTest >> testCannotBeDTO [

	| class |
	class := self entity: FamixJavaInterface named: 'Integer'.
	class isStub: true.

	self deny: (checker canBeDTO: class).
]

{ #category : #tests }
DTOCheckerTest >> testDTOsFromServices [
	| class method |
	
	class := self entity: FamixJavaClass named: 'UcSomething'.
	method := self entity: FamixJavaMethod named: 'service1'.
	method
		isPublic: true ;
		parentType: class ;
		declaredType: (self entity: FamixJavaClass named: 'DTO').

	self assert: checker dtosFromServices size equals: 1.
	self assert: checker dtosFromServices anyOne name equals: 'DTO'
]

{ #category : #tests }
DTOCheckerTest >> testDTOsFromServicesMultiple [
	| class method dto |
	
	class := self entity: FamixJavaClass named: 'UcSomething'.
	method := self entity: FamixJavaMethod named: 'service1'.
	dto := self entity: FamixJavaClass named: 'DTO1'.
	method
		isPublic: true ;
		parentType: class ;
		declaredType: dto.
	(self entity: FamixJavaParameter named: 'param1')
		parentBehaviouralEntity: method ;
		declaredType: (self entity: FamixJavaClass named: 'DTO2').
	(self entity: FamixJavaParameter named: 'param2')
		parentBehaviouralEntity: method ;
		declaredType: dto.

	self assert: checker dtosFromServices size equals: 2
]

{ #category : #tests }
DTOCheckerTest >> testDTOsFromSuperclass [
	| class |
	
	class := self entity: FamixJavaClass named: 'A_DTO'.
	(self entity: FamixJavaClass named: 'BLLazyServerPojo')
		addSubInheritance: (FamixJavaInheritance new subclass: class ; yourself) .

	self assert: checker dtosFromSuperClass size equals: 1.
	self assert: checker dtosFromSuperClass anyOne equals: class
]

{ #category : #tests }
DTOCheckerTest >> testDTOsFromSuperclassNoEnum [
	| class |
	
	class := self entity: FamixJavaClass named: 'A_Enum'.
	(self entity: FamixJavaClass named: 'BLLazyServerPojo')
		addSubInheritance: (FamixJavaInheritance new subclass: class ; yourself) .

	self assert: checker dtosFromSuperClass size equals: 0
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

{ #category : #tests }
DTOCheckerTest >> testServiceDTOFromParam [

	| method class |
	class := self entity: FamixJavaClass named: 'DTOExemple'.
	method := (self entity: FamixJavaMethod named: 'service1').
	(self entity: FamixJavaParameter named: 'param')
		parentBehaviouralEntity: method ;
		declaredType: class.

	self assert: (checker serviceDTO: method) size equals: 1.
	self assert: (checker serviceDTO: method) anyOne equals: class.
]

{ #category : #tests }
DTOCheckerTest >> testServiceDTOFromReturnType [

	| method class |
	class := self entity: FamixJavaClass named: 'DTOExemple'.
	method := (self entity: FamixJavaMethod named: 'service1').
	method declaredType: class.

	self assert: (checker serviceDTO: method) size equals: 1.
	self assert: (checker serviceDTO: method) anyOne equals: class.
]

{ #category : #tests }
DTOCheckerTest >> testServiceDTONotStub [

	| method class |
	class := self entity: FamixJavaClass named: 'DTOExemple'.
	class isStub: true.
	method := (self entity: FamixJavaMethod named: 'service1').
	method declaredType: class.

	self assert: (checker serviceDTO: method) size equals: 0
]

{ #category : #tests }
DTOCheckerTest >> testServices [

	| class |
	class := self entity: FamixJavaClass named: 'A_UC'.
	(self entity: FamixJavaMethod named: 'method1')
		isPublic: true ;
		parentType: class.
	(self entity: FamixJavaMethod named: 'method2')
		isPublic: false ;
		parentType: class.

	self assert: (checker services: class) size equals: 1.
	self assert: (checker services: class) anyOne name equals: 'method1'
]

{ #category : #tests }
DTOCheckerTest >> testServicesNotConstructors [

	| class |
	class := self entity: FamixJavaClass named: 'A_UC'.
	(self entity: FamixJavaMethod named: 'A_UC')
		isPublic: true ;
		isConstructor: true ;
		parentType: class.
	(self entity: FamixJavaMethod named: '<Initializer>')
		isPublic: true ;
		parentType: class.

	self assert: (checker services: class) size equals: 0
]
