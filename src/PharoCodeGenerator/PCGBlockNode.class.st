"
I model RBBlockNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGBlockNode,
	#superclass : #PCGValueNode,
	#traits : 'PCGTStatementsStream + PCGTBodyBlock + PCGTWithTemporaries',
	#classTraits : 'PCGTStatementsStream classTrait + PCGTBodyBlock classTrait + PCGTWithTemporaries classTrait',
	#instVars : [
		'#arguments => TypedSlot type: (SequenceableCollection withItemsType: PCGArgumentNode)',
		'#body => TypedSlot type: PCGSequenceNode'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #'instance creation' }
PCGBlockNode class >> arguments: arguments body: body [ 
	^ self new
		arguments: arguments;
		body: body;
		yourself
]

{ #category : #'instance creation' }
PCGBlockNode class >> body: body [ 
	^ self new
		body: body;
		yourself
]

{ #category : #accessing }
PCGBlockNode class >> classForRealAST [
	^ RBBlockNode
]

{ #category : #accessing }
PCGBlockNode class >> instanceVariablesForRealAST [
	^ #(#arguments #body)
]

{ #category : #visiting }
PCGBlockNode >> acceptVisitor: aVisitor [
	^ aVisitor visitBlockNode: self
]

{ #category : #accessing }
PCGBlockNode >> arguments [
	^ arguments
]

{ #category : #accessing }
PCGBlockNode >> arguments: anObject [
	arguments := anObject asOrderedCollection
]

{ #category : #accessing }
PCGBlockNode >> body [
	^ body
]

{ #category : #accessing }
PCGBlockNode >> body: anObject [
	body := anObject
]

{ #category : #initialization }
PCGBlockNode >> initialize [
	super initialize.
	self arguments: OrderedCollection new.
]

{ #category : #accessing }
PCGBlockNode >> statements [
	^ self body statements
]

{ #category : #accessing }
PCGBlockNode >> temporaries [
	^ self body temporaries
]
