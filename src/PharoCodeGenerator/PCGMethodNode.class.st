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
		'#selector => TypedSlot type: Symbol',
		'#body => TypedSlot type: PCGSequenceNode',
		'#arguments => TypedSlot type: (SequenceableCollection withItemsType: PCGArgumentNode)',
		'#pragmas => TypedSlot type: (SequenceableCollection withItemsType: PCGPragmaNode)',
		'#protocol => TypedSlot type: String'
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

{ #category : #'instance creation' }
PCGMethodNode class >> selectorKeywords: anArrayOfSymbols [ 
	^ self new
		selectorKeywords: anArrayOfSymbols;
		yourself
]

{ #category : #'instance creation' }
PCGMethodNode class >> selectorKeywords: anArrayOfSymbols arguments: arguments [ 
	^ self new
		selectorKeywords: anArrayOfSymbols;
		arguments: arguments;
		yourself
]

{ #category : #visiting }
PCGMethodNode >> acceptVisitor: aVisitor [
	^ aVisitor visitMethodNode: self
]

{ #category : #dsl }
PCGMethodNode >> addPragma: aPragmaNode [
	self pragmas
		add: aPragmaNode
]

{ #category : #dsl }
PCGMethodNode >> addPragmaNamed: aSymbol [
	self addPragmaNamed: aSymbol withAll: Array empty
]

{ #category : #dsl }
PCGMethodNode >> addPragmaNamed: aSymbol with: arg1 [
	self addPragmaNamed: aSymbol withAll: { arg1 }
]

{ #category : #dsl }
PCGMethodNode >> addPragmaNamed: aSymbol with: arg1 with: arg2 [
	self addPragmaNamed: aSymbol withAll: { arg1. arg2 }
]

{ #category : #dsl }
PCGMethodNode >> addPragmaNamed: aSymbol with: arg1 with: arg2 with: arg3 [
	self addPragmaNamed: aSymbol withAll: { arg1. arg2. arg3 }
]

{ #category : #dsl }
PCGMethodNode >> addPragmaNamed: aSymbol withAll: args [
	self addPragma: (PCGPragmaNode selector: aSymbol arguments: args)
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

{ #category : #accessing }
PCGMethodNode >> generatedPragmaSelector [
	^ #generated
]

{ #category : #initialization }
PCGMethodNode >> initialize [
	super initialize.
	self
		arguments: OrderedCollection new;
		pragmas: OrderedCollection new;
		protocol: Protocol unclassified;
		withGeneratedPragma
]

{ #category : #installing }
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

{ #category : #dsl }
PCGMethodNode >> selectorKeywords: anArrayOfSymbols [
	self selector: (Symbol newFrom: (anArrayOfSymbols size = 1 ifTrue: [ anArrayOfSymbols first ] ifFalse: [ anArrayOfSymbols flatCollect: #yourself ]))
]

{ #category : #accessing }
PCGMethodNode >> statements [
	^ self body statements
]

{ #category : #accessing }
PCGMethodNode >> temporaries [
	^ self body temporaries
]

{ #category : #dsl }
PCGMethodNode >> withGeneratedPragma [
	self pragmas
		detect: [ :pragma | pragma name = self generatedPragmaSelector ]
		ifNone: [ self addPragmaNamed: self generatedPragmaSelector ]
]

{ #category : #dsl }
PCGMethodNode >> withoutGeneratedPragma [
	self pragmas
		removeAllSuchThat: [ :pragma | pragma selector = self generatedPragmaSelector ]
]
