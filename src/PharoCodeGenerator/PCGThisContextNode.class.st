"
I model RBThisContextNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGThisContextNode,
	#superclass : #PCGVariableNode,
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGThisContextNode class >> classForRealAST [
	^ RBThisContextNode
]

{ #category : #visiting }
PCGThisContextNode >> acceptVisitor: aVisitor [
	^ aVisitor visitThisContextNode: self
]

{ #category : #initialization }
PCGThisContextNode >> initialize [
	super initialize.
	self name: #thisContext
]
