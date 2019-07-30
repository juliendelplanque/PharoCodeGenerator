"
I model RBLiteralValueNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGLiteralValueNode,
	#superclass : #PCGLiteralNode,
	#instVars : [
		'#value => TypedSlot type: Object'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGLiteralValueNode class >> classForRealAST [
	^ RBLiteralValueNode
]

{ #category : #accessing }
PCGLiteralValueNode class >> instanceVariablesForRealAST [
	^ #(#value)
]

{ #category : #'instance creation' }
PCGLiteralValueNode class >> value: value [ 
	^ self new
		value: value;
		yourself
]

{ #category : #visiting }
PCGLiteralValueNode >> acceptVisitor: aVisitor [
	^ aVisitor visitLiteralValueNode: self
]

{ #category : #accessing }
PCGLiteralValueNode >> value [
	^ value
]

{ #category : #accessing }
PCGLiteralValueNode >> value: anObject [
	value := anObject
]
