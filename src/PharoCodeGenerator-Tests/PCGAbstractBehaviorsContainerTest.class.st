"
A PCGAbstractBehaviorsContainerTest is a test class for testing the behavior of PCGAbstractBehaviorsContainer
"
Class {
	#name : #PCGAbstractBehaviorsContainerTest,
	#superclass : #TestCase,
	#category : #'PharoCodeGenerator-Tests-MetaModel'
}

{ #category : #test }
PCGAbstractBehaviorsContainerTest >> testName [
	| container |
	container := PCGAbstractBehaviorsContainer new.
	
	container name: 'Foo'.
	
	self assert: container name class equals: PCGLiteralValueNode.
	self assert: container name value equals: 'Foo'.
]
