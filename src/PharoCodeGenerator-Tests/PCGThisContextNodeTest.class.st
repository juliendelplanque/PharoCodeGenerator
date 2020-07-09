"
A PCGThisContextNodeTest is a test class for testing the behavior of PCGThisContextNode
"
Class {
	#name : #PCGThisContextNodeTest,
	#superclass : #PCGTestCase,
	#instVars : [
		'thisContextNode'
	],
	#category : #'PharoCodeGenerator-Tests-AST'
}

{ #category : #running }
PCGThisContextNodeTest >> setUp [
	super setUp.
	thisContextNode := PCGThisContextNode new
]

{ #category : #tests }
PCGThisContextNodeTest >> testEnsureNameIsUnmodifiable [
	self should: [ thisContextNode name: 'foo' ] raise: Error
]
