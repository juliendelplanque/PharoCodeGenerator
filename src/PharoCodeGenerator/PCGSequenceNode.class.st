"
I model RBSequenceNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGSequenceNode,
	#superclass : #PCGProgramNode,
	#traits : 'PCGTStatementsStream + PCGTWithTemporaries',
	#classTraits : 'PCGTStatementsStream classTrait + PCGTWithTemporaries classTrait',
	#instVars : [
		'#statements type: (SequenceableCollection withItemsType: PCGTStatement)',
		'#temporaries type: (SequenceableCollection withItemsType: PCGTemporaryNode)'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGSequenceNode class >> instanceVariablesForRealAST [
	^ #(#statements #temporaries)
]

{ #category : #'instance creation' }
PCGSequenceNode class >> statements: statements [ 
	^ self new
		statements: statements;
		yourself
]

{ #category : #'instance creation' }
PCGSequenceNode class >> temporaries: temporaries statements: statements [ 
	^ self new
		temporaries: temporaries;
		statements: statements;
		yourself
]

{ #category : #comparing }
PCGSequenceNode >> = anObject [
	<generated>
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ statements = anObject statements
		and: [ temporaries = anObject temporaries ]
]

{ #category : #visiting }
PCGSequenceNode >> acceptVisitor: aVisitor [
	^ aVisitor visitSequenceNode: self
]

{ #category : #comparing }
PCGSequenceNode >> hash [
	<generated>
	^ statements hash bitXor: temporaries hash
]

{ #category : #initialization }
PCGSequenceNode >> initialize [
	super initialize.
	self temporaries: OrderedCollection new.
	self statements: OrderedCollection new
]

{ #category : #testing }
PCGSequenceNode >> isSequence [
	<generated>
	^ true
]

{ #category : #accessing }
PCGSequenceNode >> statements [
	^ statements
]

{ #category : #accessing }
PCGSequenceNode >> statements: anObject [
	statements := anObject asOrderedCollection
]

{ #category : #accessing }
PCGSequenceNode >> temporaries [
	^ temporaries
]

{ #category : #accessing }
PCGSequenceNode >> temporaries: anObject [
	temporaries := anObject asOrderedCollection
]
