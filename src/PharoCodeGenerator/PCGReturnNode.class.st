"
I model RBReturnNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGReturnNode,
	#superclass : #PCGProgramNode,
	#instVars : [
		'value'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGReturnNode class >> classForRealAST [
	^ RBReturnNode
]

{ #category : #accessing }
PCGReturnNode class >> instanceVariablesForRealAST [
	^ #(#value)
]

{ #category : #'instance creation' }
PCGReturnNode class >> value: value [ 
	^ self new
		value: value;
		yourself
]

{ #category : #visiting }
PCGReturnNode >> acceptVisitor: aVisitor [
	^ aVisitor visitReturnNode: self
]

{ #category : #accessing }
PCGReturnNode >> value [
	^ value
]

{ #category : #accessing }
PCGReturnNode >> value: anObject [
	value := anObject
]
