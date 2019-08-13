"
I model RBLiteralValueNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGLiteralValueNode,
	#superclass : #PCGLiteralNode,
	#instVars : [
		'#value type: Object'
	],
	#category : #'PharoCodeGenerator-AST'
}

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

{ #category : #comparing }
PCGLiteralValueNode >> = anObject [
	<generated>
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ value = anObject value
]

{ #category : #visiting }
PCGLiteralValueNode >> acceptVisitor: aVisitor [
	^ aVisitor visitLiteralValueNode: self
]

{ #category : #comparing }
PCGLiteralValueNode >> hash [
	<generated>
	^ value hash
]

{ #category : #accessing }
PCGLiteralValueNode >> value [
	^ value
]

{ #category : #accessing }
PCGLiteralValueNode >> value: anObject [
	value := anObject
]
