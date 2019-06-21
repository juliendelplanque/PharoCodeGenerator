"
I model {1} node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGSuperNode,
	#superclass : #PCGVariableNode,
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGSuperNode class >> classForRealAST [
	^ RBSuperNode
]

{ #category : #visiting }
PCGSuperNode >> acceptVisitor: aVisitor [
	^ aVisitor visitSuperNode: self
]

{ #category : #initialization }
PCGSuperNode >> initialize [
	super initialize.
	self name: #super
]
