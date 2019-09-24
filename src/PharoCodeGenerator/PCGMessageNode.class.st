"
I model RBMessageNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGMessageNode,
	#superclass : #PCGValueNode,
	#traits : 'PCGTMessageReceiver',
	#classTraits : 'PCGTMessageReceiver classTrait',
	#instVars : [
		'#receiver type: PCGValueNode',
		'#selector type: Symbol',
		'#arguments type: (SequenceableCollection withItemsType: PCGValueNode)'
	],
	#category : #'PharoCodeGenerator-AST'
}

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

{ #category : #'instance creation' }
PCGMessageNode class >> receiver: receiver selector: selector with: arg1 [
	^ self receiver: receiver selector: selector arguments: { arg1 } 
]

{ #category : #'instance creation' }
PCGMessageNode class >> receiver: receiver selector: selector with: arg1 with: arg2 [
	^ self receiver: receiver selector: selector arguments: { arg1. arg2 } 
]

{ #category : #'instance creation' }
PCGMessageNode class >> receiver: receiver selector: selector with: arg1 with: arg2 with: arg3 [
	^ self receiver: receiver selector: selector arguments: { arg1. arg2. arg3 } 
]

{ #category : #comparing }
PCGMessageNode >> = anObject [
	<generated>
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ receiver = anObject receiver
		and: [ selector = anObject selector and: [ arguments = anObject arguments ] ]
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

{ #category : #comparing }
PCGMessageNode >> hash [
	<generated>
	^ (receiver hash bitXor: selector hash) bitXor: arguments hash
]

{ #category : #initialization }
PCGMessageNode >> initialize [
	super initialize.
	self arguments: OrderedCollection new.
]

{ #category : #testing }
PCGMessageNode >> isMessage [
	<generated>
	^ true
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
