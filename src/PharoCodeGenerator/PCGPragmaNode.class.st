"
I model RBPragmaNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGPragmaNode,
	#superclass : #PCGProgramNode,
	#instVars : [
		'#selector type: Symbol',
		'#arguments type: (SequenceableCollection withItemsType: PCGLiteralNode)'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGPragmaNode class >> instanceVariablesForRealAST [
	^ #(#selector #arguments)
]

{ #category : #'instance creation' }
PCGPragmaNode class >> selector: selector [ 
	^ self new
		selector: selector;
		yourself
]

{ #category : #'instance creation' }
PCGPragmaNode class >> selector: selector arguments: arguments [ 
	^ self new
		selector: selector;
		arguments: arguments;
		yourself
]

{ #category : #comparing }
PCGPragmaNode >> = anObject [
	<generated>
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ selector = anObject selector
		and: [ arguments = anObject arguments ]
]

{ #category : #visiting }
PCGPragmaNode >> acceptVisitor: aVisitor [
	^ aVisitor visitPragmaNode: self
]

{ #category : #accessing }
PCGPragmaNode >> arguments [
	^ arguments
]

{ #category : #accessing }
PCGPragmaNode >> arguments: anObject [
	arguments := anObject asOrderedCollection
]

{ #category : #comparing }
PCGPragmaNode >> hash [
	<generated>
	^ selector hash bitXor: arguments hash
]

{ #category : #initialization }
PCGPragmaNode >> initialize [
	super initialize.
	self arguments: OrderedCollection new.
]

{ #category : #testing }
PCGPragmaNode >> isPragma [
	<generated>
	^ true
]

{ #category : #accessing }
PCGPragmaNode >> selector [
	^ selector
]

{ #category : #accessing }
PCGPragmaNode >> selector: anObject [
	selector := anObject
]
