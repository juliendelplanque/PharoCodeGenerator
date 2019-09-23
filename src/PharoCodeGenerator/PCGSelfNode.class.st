"
I model RBSelfNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGSelfNode,
	#superclass : #PCGVariableNode,
	#traits : 'PCGTUnchangeableName',
	#classTraits : 'PCGTUnchangeableName classTrait',
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #visiting }
PCGSelfNode >> acceptVisitor: aVisitor [
	^ aVisitor visitSelfNode: self
]

{ #category : #initialization }
PCGSelfNode >> initialize [
	super initialize.
	name := #self
]

{ #category : #testing }
PCGSelfNode >> isSelf [
	<generated>
	^ true
]
