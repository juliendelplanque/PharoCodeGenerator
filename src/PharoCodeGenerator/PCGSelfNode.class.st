"
I model RBSelfNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGSelfNode,
	#superclass : #PCGVariableNode,
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGSelfNode class >> classForRealAST [
	^ RBSelfNode
]

{ #category : #visiting }
PCGSelfNode >> acceptVisitor: aVisitor [
	^ aVisitor visitSelfNode: self
]

{ #category : #initialization }
PCGSelfNode >> initialize [
	super initialize.
	self name: #self
]
