"
I model RBLiteralArrayNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGLiteralArrayNode,
	#superclass : #PCGLiteralNode,
	#instVars : [
		'#contents type: (SequenceableCollection withItemsType: PCGLiteralNode)'
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

{ #category : #comparing }
PCGLiteralArrayNode >> = anObject [
	<generated>
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ contents = anObject contents
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

{ #category : #comparing }
PCGLiteralArrayNode >> hash [
	<generated>
	^ contents hash
]
