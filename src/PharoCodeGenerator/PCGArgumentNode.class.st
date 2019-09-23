"
I model RBArgumentNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGArgumentNode,
	#superclass : #PCGVariableNode,
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #visiting }
PCGArgumentNode >> acceptVisitor: aVisitor [
	^ aVisitor visitArgumentNode: self
]

{ #category : #converting }
PCGArgumentNode >> asPCGArgument [
	^ self
]

{ #category : #testing }
PCGArgumentNode >> isArgument [
	<generated>
	^ true
]
