"
A PCGMethodNodeTest is a test class for testing the behavior of PCGMethodNode
"
Class {
	#name : #PCGMethodNodeTest,
	#superclass : #PCGTestCase,
	#instVars : [
		'method'
	],
	#category : #'PharoCodeGenerator-Tests-AST'
}

{ #category : #running }
PCGMethodNodeTest >> setUp [
	super setUp.
	method := (PCGMethodNode selector: #test) bodyBlock: [ :body |
	body 
		addTemporary: #foo asPCGTemporary;
		<< ((1 asPCG receiveMessage: #+ with: 1 asPCG) assignTo: #foo asPCGTemporary).
	body << 42 asPCG returnIt ].

	method protocol: 'generated'
]

{ #category : #running }
PCGMethodNodeTest >> tearDown [
	PCGFakeClass methodsDo: #removeFromSystem.
	PCGFakeClass class methodsDo: #removeFromSystem.
	
	PCGFakeTrait methodsDo: #removeFromSystem.
	PCGFakeTrait class methodsDo: #removeFromSystem.
	super tearDown
]

{ #category : #test }
PCGMethodNodeTest >> testAddPragmaNamed [
	self assert: method pragmas size equals: 1.
	self assert: method pragmas first selector equals: #generated.
	
	method addPragmaNamed: #testPragma.
	
	self assert: method pragmas size equals: 2.
	self assert: method pragmas second selector equals: #testPragma.
	self assert: method pragmas second arguments size equals: 0.
	self assert: (method pragmas second arguments collect: #name) asArray equals: #().
]

{ #category : #test }
PCGMethodNodeTest >> testInitialize [
	| freshMethod |
	freshMethod := PCGMethodNode new.
	
	self assert: freshMethod selector isNil.
	self assert: freshMethod arguments isEmpty.
	self assert: freshMethod body statements isEmpty.
	self assert: freshMethod pragmas size equals: 1.
	self assert: freshMethod pragmas anyOne selector equals: #generated
]

{ #category : #test }
PCGMethodNodeTest >> testInstallOn [
	self deny: (PCGFakeClass canUnderstand: method selector).
	method
		withoutGeneratedPragma.
	
	self shouldnt: [ method installOn: PCGFakeClass ] raise: PCGHandwrittenMethodAlreadyExist.
	
	self assert: (PCGFakeClass canUnderstand: method selector).
	self assert: (PCGFakeClass >> method selector) protocol equals: 'generated'.
	
	self should: [ method installOn: PCGFakeClass ] raise: PCGHandwrittenMethodAlreadyExist
]

{ #category : #test }
PCGMethodNodeTest >> testInstallOnClassSide [
	self deny: (PCGFakeClass class canUnderstand: method selector).
	
	method installOn: PCGFakeClass class.
	
	self assert: (PCGFakeClass class canUnderstand: method selector).
	self assert: (PCGFakeClass class >> method selector) protocol equals: 'generated'
]

{ #category : #test }
PCGMethodNodeTest >> testInstallOnTrait [
	self deny: (PCGFakeTrait canUnderstand: method selector).
	
	method installOn: PCGFakeTrait.
	
	self assert: (PCGFakeTrait canUnderstand: method selector).
	self assert: (PCGFakeTrait >> method selector) protocol equals: 'generated'
]

{ #category : #test }
PCGMethodNodeTest >> testInstallOnTraitClassSide [
	self deny: (PCGFakeTrait class canUnderstand: method selector).
	
	method installOn: PCGFakeTrait class.
	
	self assert: (PCGFakeTrait class canUnderstand: method selector).
	self assert: (PCGFakeTrait class >> method selector) protocol equals: 'generated'
]

{ #category : #test }
PCGMethodNodeTest >> testSelectorKeywords [
	method selectorKeywords: #(this: is: a: selector:).
	
	self assert: method selector equals: #this:is:a:selector:
]

{ #category : #test }
PCGMethodNodeTest >> testSourceCode [
	self assertSourceCodeOf: method equals: 'test
  < generated>
  | foo |
  foo := 1 + 1.
  ^42'
]

{ #category : #test }
PCGMethodNodeTest >> testWithGeneratedPragma [
	method withGeneratedPragma: true.
	
	self assert: (method pragmas anySatisfy: [ :p | p selector = PCGMethodNode generatedPragmaSelector ]).
	
	method withGeneratedPragma: false.
	
	self deny: (method pragmas anySatisfy: [ :p | p selector = PCGMethodNode generatedPragmaSelector ]).
]

{ #category : #test }
PCGMethodNodeTest >> testWithoutGeneratedPragma [
	method withoutGeneratedPragma.
	
	self deny: (method pragmas anySatisfy: [ :p | p selector = PCGMethodNode generatedPragmaSelector ]).
	
	self assertSourceCodeOf: method equals: 'test
  | foo |
  foo := 1 + 1.
  ^42'
]
