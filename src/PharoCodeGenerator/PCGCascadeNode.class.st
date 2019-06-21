"
I model {1} node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGCascadeNode,
	#superclass : #PCGValueNode,
	#instVars : [
		'messages'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGCascadeNode class >> classForRealAST [
	^ RBCascadeNode
]

{ #category : #accessing }
PCGCascadeNode class >> instanceVariablesForRealAST [
	^ #(#messages)
]

{ #category : #'instance creation' }
PCGCascadeNode class >> messages: messages [ 
	^ self new
		messages: messages;
		yourself
]

{ #category : #visiting }
PCGCascadeNode >> acceptVisitor: aVisitor [
	^ aVisitor visitCascadeNode: self
]

{ #category : #accessing }
PCGCascadeNode >> messages [
	^ messages
]

{ #category : #accessing }
PCGCascadeNode >> messages: anObject [
	messages := anObject asOrderedCollection
]
