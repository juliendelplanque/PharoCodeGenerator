"
I model RBGlobalNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGGlobalNode,
	#superclass : #PCGVariableNode,
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGGlobalNode class >> classForRealAST [
	^ RBGlobalNode
]

{ #category : #visiting }
PCGGlobalNode >> acceptVisitor: aVisitor [
	^ aVisitor visitGlobalNode: self
]
