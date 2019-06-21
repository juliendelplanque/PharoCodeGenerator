"
I model {1} node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGLiteralArrayNode,
	#superclass : #PCGLiteralNode,
	#instVars : [
		'contents'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGLiteralArrayNode class >> classForRealAST [
	^ RBLiteralArrayNode
]

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
