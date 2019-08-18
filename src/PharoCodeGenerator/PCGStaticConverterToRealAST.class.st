"
I am an abstract visit that convert a PCG AST to another kind of AST.

My subclasses must implement all the methods in 'factory' protocol.
These methods must create a node of the right type from the parameters provided.
"
Class {
	#name : #PCGStaticConverterToRealAST,
	#superclass : #PCGVisitor,
	#category : #'PharoCodeGenerator-Visitors'
}

{ #category : #'methods generation' }
PCGStaticConverterToRealAST class >> buildFactoryMethodSelectorKeywordsFor: class [
	| selectorKeywords |
	selectorKeywords := class instanceVariablesForRealAST
		collect: [ :instVarName | instVarName asMutator ].
	selectorKeywords
		at: 1
		put:
			('create' , (class classForRealAST name allButFirst: 'RB' size)
				, 'With' , selectorKeywords first asCamelCase) asSymbol.
	^ selectorKeywords
]

{ #category : #factory }
PCGStaticConverterToRealAST >> createArgumentNodeWithName: name [
	<generated>
	^ self subclassResponsibility
]

{ #category : #factory }
PCGStaticConverterToRealAST >> createArrayNodeWithStatements: statements [
	<generated>
	^ self subclassResponsibility
]

{ #category : #factory }
PCGStaticConverterToRealAST >> createAssignmentNodeWithVariable: variable value: value [
	<generated>
	^ self subclassResponsibility
]

{ #category : #factory }
PCGStaticConverterToRealAST >> createBlockNodeWithArguments: arguments body: body [
	<generated>
	^ self subclassResponsibility
]

{ #category : #factory }
PCGStaticConverterToRealAST >> createCascadeNodeWithMessages: messages [
	<generated>
	^ self subclassResponsibility
]

{ #category : #factory }
PCGStaticConverterToRealAST >> createGlobalNodeWithName: name [
	<generated>
	^ self subclassResponsibility
]

{ #category : #factory }
PCGStaticConverterToRealAST >> createInstanceVariableNodeWithName: name [
	<generated>
	^ self subclassResponsibility
]

{ #category : #factory }
PCGStaticConverterToRealAST >> createLiteralArrayNodeWithContents: contents [
	<generated>
	^ self subclassResponsibility
]

{ #category : #factory }
PCGStaticConverterToRealAST >> createLiteralValueNodeWithValue: value [
	<generated>
	^ self subclassResponsibility
]

{ #category : #factory }
PCGStaticConverterToRealAST >> createMessageNodeWithReceiver: receiver selector: selector arguments: arguments [
	<generated>
	^ self subclassResponsibility
]

{ #category : #factory }
PCGStaticConverterToRealAST >> createMethodNodeWithSelector: selector body: body arguments: arguments pragmas: pragmas [
	<generated>
	^ self subclassResponsibility
]

{ #category : #factory }
PCGStaticConverterToRealAST >> createPragmaNodeWithSelector: selector arguments: arguments [
	<generated>
	^ self subclassResponsibility
]

{ #category : #factory }
PCGStaticConverterToRealAST >> createReturnNodeWithValue: value [
	<generated>
	^ self subclassResponsibility
]

{ #category : #factory }
PCGStaticConverterToRealAST >> createSelfNodeWithName: name [
	<generated>
	^ self subclassResponsibility
]

{ #category : #factory }
PCGStaticConverterToRealAST >> createSequenceNodeWithStatements: statements temporaries: temporaries [
	<generated>
	^ self subclassResponsibility
]

{ #category : #factory }
PCGStaticConverterToRealAST >> createSuperNodeWithName: name [
	<generated>
	^ self subclassResponsibility
]

{ #category : #factory }
PCGStaticConverterToRealAST >> createTemporaryNodeWithName: name [
	<generated>
	^ self subclassResponsibility
]

{ #category : #factory }
PCGStaticConverterToRealAST >> createThisContextNodeWithName: name [
	<generated>
	^ self subclassResponsibility
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visit: anObject [
	"Here we consider that sometimes an attempt to visit an object that is not a PCGProgramNode can be made.
	 If it happens, the object is copied and this copy is returned.
	"
	anObject isPCGProgramNode
		ifFalse: [ ^ anObject copy ].
		
	^ super visit: anObject
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitArgumentNode: anArgumentNode [
	<generated>
	^ self createArgumentNodeWithName: (self visit: anArgumentNode name)
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitArrayNode: anArrayNode [
	<generated>
	^ self
		createArrayNodeWithStatements: (anArrayNode statements collect: [ :toVisit | self visit: toVisit ])
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitAssignmentNode: anAssignmentNode [
	<generated>
	^ self
		createAssignmentNodeWithVariable: (self visit: anAssignmentNode variable)
		value: (self visit: anAssignmentNode value)
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitBlockNode: aBlockNode [
	<generated>
	^ self
		createBlockNodeWithArguments: (aBlockNode arguments collect: [ :toVisit | self visit: toVisit ])
		body: (self visit: aBlockNode body)
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitCascadeNode: aCascadeNode [
	<generated>
	^ self
		createCascadeNodeWithMessages: (aCascadeNode messages collect: [ :toVisit | self visit: toVisit ])
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitGlobalNode: aGlobalNode [
	<generated>
	^ self createGlobalNodeWithName: (self visit: aGlobalNode name)
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitInstanceVariableNode: anInstanceVariableNode [
	<generated>
	^ self
		createInstanceVariableNodeWithName: (self visit: anInstanceVariableNode name)
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitLiteralArrayNode: aLiteralArrayNode [
	<generated>
	^ self
		createLiteralArrayNodeWithContents:
			(aLiteralArrayNode contents
				collect: [ :toVisit | self visit: toVisit ])
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitLiteralValueNode: aLiteralValueNode [
	<generated>
	^ self
		createLiteralValueNodeWithValue: (self visit: aLiteralValueNode value)
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitMessageNode: aMessageNode [
	<generated>
	^ self
		createMessageNodeWithReceiver: (self visit: aMessageNode receiver)
		selector: (self visit: aMessageNode selector)
		arguments: (aMessageNode arguments collect: [ :toVisit | self visit: toVisit ])
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitMethodNode: aMethodNode [
	<generated>
	^ self
		createMethodNodeWithSelector: (self visit: aMethodNode selector)
		body: (self visit: aMethodNode body)
		arguments: (aMethodNode arguments collect: [ :toVisit | self visit: toVisit ])
		pragmas: (aMethodNode pragmas collect: [ :toVisit | self visit: toVisit ])
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitPragmaNode: aPragmaNode [
	<generated>
	^ self
		createPragmaNodeWithSelector: (self visit: aPragmaNode selector)
		arguments: (aPragmaNode arguments collect: [ :toVisit | self visit: toVisit ])
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitProgramNode: aProgramNode [
	"This node should never be visited since it is abstract."
	^ self shouldNotImplement
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitReturnNode: aReturnNode [
	<generated>
	^ self createReturnNodeWithValue: (self visit: aReturnNode value)
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitSelfNode: aSelfNode [
	<generated>
	^ self createSelfNodeWithName: (self visit: aSelfNode name)
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitSequenceNode: aSequenceNode [
	<generated>
	^ self
		createSequenceNodeWithStatements: (aSequenceNode statements collect: [ :toVisit | self visit: toVisit ])
		temporaries: (aSequenceNode temporaries collect: [ :toVisit | self visit: toVisit ])
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitSuperNode: aSuperNode [
	<generated>
	^ self createSuperNodeWithName: (self visit: aSuperNode name)
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitTemplateParameter: aTemplateParameter [
	^ self error: 'Attempt to convert template AST to real source code.'
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitTemporaryNode: aTemporaryNode [
	<generated>
	^ self createTemporaryNodeWithName: (self visit: aTemporaryNode name)
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitThisContextNode: aThisContextNode [
	<generated>
	^ self
		createThisContextNodeWithName: (self visit: aThisContextNode name)
]
