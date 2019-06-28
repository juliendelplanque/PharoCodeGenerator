"
I model RBVariableNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGVariableNode,
	#superclass : #PCGValueNode,
	#traits : 'PCGTMessageReceiver',
	#classTraits : 'PCGTMessageReceiver classTrait',
	#instVars : [
		'#name => TypedSlot type: Symbol'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGVariableNode class >> classForRealAST [
	^ RBVariableNode
]

{ #category : #accessing }
PCGVariableNode class >> instanceVariablesForRealAST [
	^ #(#name)
]

{ #category : #'instance creation' }
PCGVariableNode class >> name: name [ 
	^ self new
		name: name;
		yourself
]

{ #category : #comparing }
PCGVariableNode >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ name = anObject name
]

{ #category : #comparing }
PCGVariableNode >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ name hash
]

{ #category : #accessing }
PCGVariableNode >> name [
	^ name
]

{ #category : #accessing }
PCGVariableNode >> name: anObject [
	name := anObject
]
