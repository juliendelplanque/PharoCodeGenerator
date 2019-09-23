"
I model RBReturnNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGReturnNode,
	#superclass : #PCGProgramNode,
	#traits : 'PCGTStatement',
	#classTraits : 'PCGTStatement classTrait',
	#instVars : [
		'#value type: PCGValueNode'
	],
	#category : #'PharoCodeGenerator-AST'
}

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

{ #category : #comparing }
PCGReturnNode >> = anObject [
	<generated>
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ value = anObject value
]

{ #category : #visiting }
PCGReturnNode >> acceptVisitor: aVisitor [
	^ aVisitor visitReturnNode: self
]

{ #category : #comparing }
PCGReturnNode >> hash [
	<generated>
	^ value hash
]

{ #category : #testing }
PCGReturnNode >> isReturn [
	<generated>
	^ true
]

{ #category : #accessing }
PCGReturnNode >> value [
	^ value
]

{ #category : #accessing }
PCGReturnNode >> value: anObject [
	value := anObject
]
