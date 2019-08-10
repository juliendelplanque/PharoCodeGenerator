"
I model RBInstanceVariableNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGInstanceVariableNode,
	#superclass : #PCGVariableNode,
	#traits : 'PCGTAssignmentTarget',
	#classTraits : 'PCGTAssignmentTarget classTrait',
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #visiting }
PCGInstanceVariableNode >> acceptVisitor: aVisitor [
	^ aVisitor visitInstanceVariableNode: self
]

{ #category : #converting }
PCGInstanceVariableNode >> asPCGInstanceVariable [
	^ self
]
