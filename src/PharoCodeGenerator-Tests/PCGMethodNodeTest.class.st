"
A PCGMethodNodeTest is a test class for testing the behavior of PCGMethodNode
"
Class {
	#name : #PCGMethodNodeTest,
	#superclass : #TestCase,
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
		<< ((1 asPCG receiveMessage: #+ with: { 1 asPCG }) assignTo: #foo asPCGTemporary).
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
PCGMethodNodeTest >> testInstallOn [
	self deny: (PCGFakeClass canUnderstand: method selector).
	
	method installOn: PCGFakeClass.
	
	self assert: (PCGFakeClass canUnderstand: method selector).
	self assert: (PCGFakeClass >> method selector) protocol equals: 'generated'
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
PCGMethodNodeTest >> testSourceCode [
	self assert: method sourceCode equals: 'test
	| foo |
	foo := 1 + 1.
	^ 42'
]
