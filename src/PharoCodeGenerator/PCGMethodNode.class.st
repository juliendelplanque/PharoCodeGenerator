"
I model RBMethodNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGMethodNode,
	#superclass : #PCGProgramNode,
	#traits : 'PCGTStatementsStream + PCGTBodyBlock + PCGTWithTemporaries + PCGTInstallableEntity',
	#classTraits : 'PCGTStatementsStream classTrait + PCGTBodyBlock classTrait + PCGTWithTemporaries classTrait + PCGTInstallableEntity classTrait',
	#instVars : [
		'#selector type: Symbol',
		'#body type: PCGSequenceNode',
		'#arguments type: (SequenceableCollection withItemsType: PCGArgumentNode)',
		'#pragmas type: (SequenceableCollection withItemsType: PCGPragmaNode)',
		'#protocol type: String'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGMethodNode class >> generatedPragmaSelector [
	^ #generated
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

{ #category : #comparing }
PCGMethodNode >> = anObject [
	<generated>
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ selector = anObject selector
		and: [ body = anObject body
				and: [ arguments = anObject arguments
						and: [ pragmas = anObject pragmas and: [ protocol = anObject protocol ] ] ] ]
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
PCGMethodNode >> addPragmaNamed: aSymbol if: conditionBlock [
	self addPragmaNamed: aSymbol withAll: Array new if: conditionBlock
]

{ #category : #dsl }
PCGMethodNode >> addPragmaNamed: aSymbol with: arg1 [
	self addPragmaNamed: aSymbol withAll: { arg1 }
]

{ #category : #dsl }
PCGMethodNode >> addPragmaNamed: aSymbol with: arg1 if: conditionBlock [
	self addPragmaNamed: aSymbol withAll: { arg1 } if: conditionBlock
]

{ #category : #dsl }
PCGMethodNode >> addPragmaNamed: aSymbol with: arg1 with: arg2 [
	self addPragmaNamed: aSymbol withAll: { arg1. arg2 }
]

{ #category : #dsl }
PCGMethodNode >> addPragmaNamed: aSymbol with: arg1 with: arg2 if: conditionBlock [
	self addPragmaNamed: aSymbol withAll: { arg1. arg2 } if: conditionBlock
]

{ #category : #dsl }
PCGMethodNode >> addPragmaNamed: aSymbol with: arg1 with: arg2 with: arg3 [
	self addPragmaNamed: aSymbol withAll: { arg1. arg2. arg3 }
]

{ #category : #dsl }
PCGMethodNode >> addPragmaNamed: aSymbol with: arg1 with: arg2 with: arg3 if: conditionBlock [
	self addPragmaNamed: aSymbol withAll: { arg1. arg2. arg3 } if: conditionBlock
]

{ #category : #dsl }
PCGMethodNode >> addPragmaNamed: aSymbol withAll: args [
	self addPragma: (PCGPragmaNode selector: aSymbol arguments: args)
]

{ #category : #dsl }
PCGMethodNode >> addPragmaNamed: aSymbol withAll: args if: conditionBlock [
	conditionBlock value
		ifFalse: [ ^ self ].

	^ self addPragmaNamed: aSymbol withAll: args
]

{ #category : #accessing }
PCGMethodNode >> arguments [
	^ arguments
]

{ #category : #accessing }
PCGMethodNode >> arguments: anObject [
	arguments := anObject asOrderedCollection
]

{ #category : #converting }
PCGMethodNode >> asExtensionMethod [
	^ PCGExtensionMethod methodNode: self
]

{ #category : #converting }
PCGMethodNode >> asPCGAST [
	^ self
]

{ #category : #dsl }
PCGMethodNode >> beReturnedSubclassResponsibility [
	self bodyBlock: [ :b | b << (#self asPCGNode receiveMessage: #subclassResponsibility) returnIt ]
]

{ #category : #dsl }
PCGMethodNode >> beSubclassResponsibility [
	self bodyBlock: [ :b | b << (#self asPCGNode receiveMessage: #subclassResponsibility) ]
]

{ #category : #accessing }
PCGMethodNode >> body [
	^ body
]

{ #category : #accessing }
PCGMethodNode >> body: anObject [
	body := anObject
]

{ #category : #dsl }
PCGMethodNode >> emptyBody [
	self bodyBlock: [ :b | ]
]

{ #category : #accessing }
PCGMethodNode >> generatedPragmaSelector [
	^ self class generatedPragmaSelector
]

{ #category : #comparing }
PCGMethodNode >> hash [
	<generated>
	^ (((selector hash bitXor: body hash) bitXor: arguments hash)
		bitXor: pragmas hash) bitXor: protocol hash
]

{ #category : #initialization }
PCGMethodNode >> initialize [
	super initialize.
	self
		arguments: OrderedCollection new;
		pragmas: OrderedCollection new;
		protocol: Protocol unclassified;
		emptyBody;
		withGeneratedPragma
]

{ #category : #installing }
PCGMethodNode >> installOn: aBehavior [
	^ aBehavior installPCGMethod: self
]

{ #category : #testing }
PCGMethodNode >> isInstallationNecessaryOn: aClass [
	^ [ (aClass includesLocalSelector: self selector) not or: [ self = (aClass >> self selector) asPCGAST ] ]
		on: Error
		do: [ "If we have an error it's probably because the current AST of the method is not valid. This means we should reinstall." true ]
]

{ #category : #testing }
PCGMethodNode >> isMethod [
	<generated>
	^ true
]

{ #category : #accessing }
PCGMethodNode >> pragmas [
	^ pragmas
]

{ #category : #accessing }
PCGMethodNode >> pragmas: anObject [
	pragmas := anObject asOrderedCollection
]

{ #category : #printing }
PCGMethodNode >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self selector printOn: aStream.
	aStream nextPut: $)
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
		detect: [ :pragma | pragma selector = self generatedPragmaSelector ]
		ifNone: [ self addPragmaNamed: self generatedPragmaSelector ]
]

{ #category : #dsl }
PCGMethodNode >> withGeneratedPragma: aBoolean [
	"Dispatch on #withGeneratedPragma if aBoolean is true else dispatch on #withoutGeneratedPragma."
	aBoolean
		ifTrue: [ self withGeneratedPragma ]
		ifFalse: [ self withoutGeneratedPragma ]
]

{ #category : #dsl }
PCGMethodNode >> withoutGeneratedPragma [
	self pragmas
		removeAllSuchThat: [ :pragma | pragma selector = self generatedPragmaSelector ]
]
