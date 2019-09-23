"
I model RBSuperNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGSuperNode,
	#superclass : #PCGVariableNode,
	#traits : 'PCGTUnchangeableName',
	#classTraits : 'PCGTUnchangeableName classTrait',
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #visiting }
PCGSuperNode >> acceptVisitor: aVisitor [
	^ aVisitor visitSuperNode: self
]

{ #category : #initialization }
PCGSuperNode >> initialize [
	super initialize.
	name := #super
]

{ #category : #testing }
PCGSuperNode >> isSuper [
	<generated>
	^ true
]
