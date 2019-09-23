"
I model RBTemporaryNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGTemporaryNode,
	#superclass : #PCGVariableNode,
	#traits : 'PCGTAssignmentTarget',
	#classTraits : 'PCGTAssignmentTarget classTrait',
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #visiting }
PCGTemporaryNode >> acceptVisitor: aVisitor [
	^ aVisitor visitTemporaryNode: self
]

{ #category : #converting }
PCGTemporaryNode >> asPCGTemporary [
	^ self
]

{ #category : #testing }
PCGTemporaryNode >> isTemporary [
	<generated>
	^ true
]
