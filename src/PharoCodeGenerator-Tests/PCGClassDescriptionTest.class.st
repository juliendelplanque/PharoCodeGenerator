"
A PCGClassDescriptionTest is a test class for testing the behavior of PCGClassDescription
"
Class {
	#name : #PCGClassDescriptionTest,
	#superclass : #TestCase,
	#category : #'PharoCodeGenerator-Tests-MetaModel'
}

{ #category : #test }
PCGClassDescriptionTest >> testInitialize [
	| classDescription |
	classDescription := PCGClassDescription new.
	
	self assert: classDescription superclassName equals: #Object.
	self assert: classDescription methods isEmpty.
	self assert: classDescription slots isEmpty.
	self assert: classDescription classVariables isEmpty
]
