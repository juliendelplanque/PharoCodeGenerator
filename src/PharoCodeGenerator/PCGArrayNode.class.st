"
I model RBArrayNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGArrayNode,
	#superclass : #PCGValueNode,
	#traits : 'PCGTMessageReceiver',
	#classTraits : 'PCGTMessageReceiver classTrait',
	#instVars : [
		'#statements type: (SequenceableCollection withItemsType: PCGTStatement)'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGArrayNode class >> instanceVariablesForRealAST [
	^ #(#statements)
]

{ #category : #'instance creation' }
PCGArrayNode class >> statements: statements [ 
	^ self new
		statements: statements;
		yourself
]

{ #category : #comparing }
PCGArrayNode >> = anObject [
	<generated>
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ statements = anObject statements
]

{ #category : #visiting }
PCGArrayNode >> acceptVisitor: aVisitor [
	^ aVisitor visitArrayNode: self
]

{ #category : #comparing }
PCGArrayNode >> hash [
	<generated>
	^ statements hash
]

{ #category : #testing }
PCGArrayNode >> isArray [
	<generated>
	^ true
]

{ #category : #accessing }
PCGArrayNode >> statements [
	^ statements
]

{ #category : #accessing }
PCGArrayNode >> statements: anObject [
	statements := anObject asOrderedCollection
]
