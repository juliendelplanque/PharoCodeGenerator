"
I model {1} node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGArgumentNode,
	#superclass : #PCGVariableNode,
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGArgumentNode class >> classForRealAST [
	^ RBArgumentNode
]

{ #category : #visiting }
PCGArgumentNode >> acceptVisitor: aVisitor [
	^ aVisitor visitArgumentNode: self
]
