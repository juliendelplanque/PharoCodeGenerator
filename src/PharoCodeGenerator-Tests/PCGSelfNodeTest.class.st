"
A PCGSelfNodeTest is a test class for testing the behavior of PCGSelfNode
"
Class {
	#name : #PCGSelfNodeTest,
	#superclass : #PCGTestCase,
	#instVars : [
		'selfNode'
	],
	#category : #'PharoCodeGenerator-Tests-AST'
}

{ #category : #running }
PCGSelfNodeTest >> setUp [
	super setUp.
	selfNode := PCGSelfNode new
]

{ #category : #tests }
PCGSelfNodeTest >> testEnsureNameIsUnmodifiable [
	self should: [ selfNode name: 'foo' ] raise: Error
]
