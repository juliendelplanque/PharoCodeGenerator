"
A PCGSuperNodeTest is a test class for testing the behavior of PCGSuperNode
"
Class {
	#name : #PCGSuperNodeTest,
	#superclass : #TestCase,
	#instVars : [
		'superNode'
	],
	#category : #'PharoCodeGenerator-Tests-AST'
}

{ #category : #running }
PCGSuperNodeTest >> setUp [
	super setUp.
	superNode := PCGSuperNode new
]

{ #category : #tests }
PCGSuperNodeTest >> testEnsureNameIsUnmodifiable [
	self should: [ superNode name: 'foo' ] raise: Error
]
