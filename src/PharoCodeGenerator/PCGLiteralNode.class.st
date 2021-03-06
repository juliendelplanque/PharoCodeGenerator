"
I model RBLiteralNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGLiteralNode,
	#superclass : #PCGValueNode,
	#traits : 'PCGTMessageReceiver',
	#classTraits : 'PCGTMessageReceiver classTrait',
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGLiteralNode class >> instanceVariablesForRealAST [
	^ #()
]

{ #category : #testing }
PCGLiteralNode >> isLiteral [
	<generated>
	^ true
]
