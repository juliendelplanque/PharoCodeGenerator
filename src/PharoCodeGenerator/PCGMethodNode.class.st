"
I model RBMethodNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGMethodNode,
	#superclass : #PCGProgramNode,
	#traits : 'PCGTStatementsStream + PCGTBodyBlock + PCGTWithTemporaries',
	#classTraits : 'PCGTStatementsStream classTrait + PCGTBodyBlock classTrait + PCGTWithTemporaries classTrait',
	#instVars : [
		'selector',
		'body',
		'arguments',
		'pragmas',
		'protocol'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGMethodNode class >> classForRealAST [
	^ RBMethodNode
]

{ #category : #accessing }
PCGMethodNode class >> instanceVariablesForRealAST [
	^ #(#selector #body #arguments #pragmas)
]

{ #category : #'instance creation' }
PCGMethodNode class >> selector: selector [ 
	^ self new
		selector: selector;
		yourself
]

{ #category : #'instance creation' }
PCGMethodNode class >> selector: selector arguments: arguments [ 
	^ self new
		selector: selector;
		arguments: arguments;
		yourself
]

{ #category : #'instance creation' }
PCGMethodNode class >> selector: selector arguments: arguments body: body [ 
	^ self new
		selector: selector;
		arguments: arguments;
		body: body;
		yourself
]

{ #category : #'instance creation' }
PCGMethodNode class >> selector: selector arguments: arguments pragmas: pragmas body: body [ 
	^ self new
		selector: selector;
		arguments: arguments;
		pragmas: pragmas;
		body: body;
		yourself
]

{ #category : #'instance creation' }
PCGMethodNode class >> selector: selector body: body [ 
	^ self new
		selector: selector;
		body: body;
		yourself
]

{ #category : #visiting }
PCGMethodNode >> acceptVisitor: aVisitor [
	^ aVisitor visitMethodNode: self
]

{ #category : #accessing }
PCGMethodNode >> arguments [
	^ arguments
]

{ #category : #accessing }
PCGMethodNode >> arguments: anObject [
	arguments := anObject asOrderedCollection
]

{ #category : #accessing }
PCGMethodNode >> body [
	^ body
]

{ #category : #accessing }
PCGMethodNode >> body: anObject [
	body := anObject
]

{ #category : #initialization }
PCGMethodNode >> initialize [
	super initialize.
	self arguments: OrderedCollection new.
	self pragmas: OrderedCollection new.
	self protocol: Protocol unclassified
]

{ #category : #displaying }
PCGMethodNode >> installOn: aBehavior [
	aBehavior compile: self sourceCode.
	(aBehavior >> self selector)
		protocol: self protocol
]

{ #category : #accessing }
PCGMethodNode >> pragmas [
	^ pragmas
]

{ #category : #accessing }
PCGMethodNode >> pragmas: anObject [
	pragmas := anObject asOrderedCollection
]

{ #category : #accessing }
PCGMethodNode >> protocol [
	^ protocol
]

{ #category : #accessing }
PCGMethodNode >> protocol: anObject [
	protocol := anObject
]

{ #category : #accessing }
PCGMethodNode >> selector [
	^ selector
]

{ #category : #accessing }
PCGMethodNode >> selector: anObject [
	selector := anObject
]

{ #category : #accessing }
PCGMethodNode >> statements [
	^ self body statements
]

{ #category : #accessing }
PCGMethodNode >> temporaries [
	^ self body temporaries
]
