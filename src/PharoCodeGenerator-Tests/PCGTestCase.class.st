Class {
	#name : #PCGTestCase,
	#superclass : #TestCase,
	#category : #'PharoCodeGenerator-Tests-Utils'
}

{ #category : #testing }
PCGTestCase class >> isAbstract [
	^ self = PCGTestCase
]

{ #category : #asserting }
PCGTestCase >> assertSourceCodeOf: aPCGNode equals: aString [
	| formattedCode |
	formattedCode := PCGSimpleFormatter new format: aPCGNode realAST.
	
	self assert: formattedCode equals: aString
]
