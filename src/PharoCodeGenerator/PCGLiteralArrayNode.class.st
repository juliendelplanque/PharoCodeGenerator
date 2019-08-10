"
I model RBLiteralArrayNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGLiteralArrayNode,
	#superclass : #PCGLiteralNode,
	#instVars : [
		'#contents => TypedSlot type: PCGLiteralNode'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #'instance creation' }
PCGLiteralArrayNode class >> contents: contents [ 
	^ self new
		contents: contents;
		yourself
]

{ #category : #accessing }
PCGLiteralArrayNode class >> instanceVariablesForRealAST [
	^ #(#contents)
]

{ #category : #visiting }
PCGLiteralArrayNode >> acceptVisitor: aVisitor [
	^ aVisitor visitLiteralArrayNode: self
]

{ #category : #accessing }
PCGLiteralArrayNode >> contents [
	^ contents
]

{ #category : #accessing }
PCGLiteralArrayNode >> contents: anObject [
	contents := anObject
]
