"
I model {1} node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGInstanceVariableNode,
	#superclass : #PCGVariableNode,
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGInstanceVariableNode class >> classForRealAST [
	^ RBInstanceVariableNode
]

{ #category : #visiting }
PCGInstanceVariableNode >> acceptVisitor: aVisitor [
	^ aVisitor visitInstanceVariableNode: self
]
