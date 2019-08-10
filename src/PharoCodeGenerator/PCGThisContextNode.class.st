"
I model RBThisContextNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGThisContextNode,
	#superclass : #PCGVariableNode,
	#traits : 'PCGTUnchangeableName',
	#classTraits : 'PCGTUnchangeableName classTrait',
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #visiting }
PCGThisContextNode >> acceptVisitor: aVisitor [
	^ aVisitor visitThisContextNode: self
]

{ #category : #initialization }
PCGThisContextNode >> initialize [
	super initialize.
	name := #thisContext
]
