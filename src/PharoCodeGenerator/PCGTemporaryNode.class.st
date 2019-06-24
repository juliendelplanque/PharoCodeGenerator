"
I model RBTemporaryNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGTemporaryNode,
	#superclass : #PCGVariableNode,
	#traits : 'PCGAssignmentTarget',
	#classTraits : 'PCGAssignmentTarget classTrait',
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGTemporaryNode class >> classForRealAST [
	^ RBTemporaryNode
]

{ #category : #visiting }
PCGTemporaryNode >> acceptVisitor: aVisitor [
	^ aVisitor visitTemporaryNode: self
]
