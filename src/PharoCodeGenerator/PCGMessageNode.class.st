"
I model {1} node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGMessageNode,
	#superclass : #PCGValueNode,
	#instVars : [
		'receiver',
		'selector',
		'arguments'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGMessageNode class >> classForRealAST [
	^ RBMessageNode
]

{ #category : #accessing }
PCGMessageNode class >> instanceVariablesForRealAST [
	^ #(#receiver #selector #arguments)
]

{ #category : #'instance creation' }
PCGMessageNode class >> receiver: receiver selector: selector [ 
	^ self new
		receiver: receiver;
		selector: selector;
		yourself
]

{ #category : #'instance creation' }
PCGMessageNode class >> receiver: receiver selector: selector arguments: arguments [ 
	^ self new
		receiver: receiver;
		selector: selector;
		arguments: arguments;
		yourself
]

{ #category : #visiting }
PCGMessageNode >> acceptVisitor: aVisitor [
	^ aVisitor visitMessageNode: self
]

{ #category : #accessing }
PCGMessageNode >> arguments [
	^ arguments
]

{ #category : #accessing }
PCGMessageNode >> arguments: anObject [
	arguments := anObject asOrderedCollection
]

{ #category : #initialization }
PCGMessageNode >> initialize [
	super initialize.
	self arguments: OrderedCollection new.
]

{ #category : #accessing }
PCGMessageNode >> receiver [
	^ receiver
]

{ #category : #accessing }
PCGMessageNode >> receiver: anObject [
	receiver := anObject
]

{ #category : #accessing }
PCGMessageNode >> selector [
	^ selector
]

{ #category : #accessing }
PCGMessageNode >> selector: anObject [
	selector := anObject
]
