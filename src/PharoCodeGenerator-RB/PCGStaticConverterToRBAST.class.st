"
I convert a PCG AST as a Pharo RB AST.
"
Class {
	#name : #PCGStaticConverterToRBAST,
	#superclass : #PCGStaticConverterToRealAST,
	#category : #'PharoCodeGenerator-RB'
}

{ #category : #factory }
PCGStaticConverterToRBAST >> createArgumentNodeWithName: name [
	^ self pharoCompatibilityRBFactory argumentNamed: name
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createArrayNodeWithStatements: statements [
	<generated>
	^ RBArrayNode new
		statements: statements;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createAssignmentNodeWithVariable: variable value: value [
	<generated>
	^ RBAssignmentNode new
		variable: variable;
		value: value;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createBlockNodeWithArguments: arguments body: body [
	<generated>
	^ RBBlockNode new
		arguments: arguments;
		body: body;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createCascadeNodeWithMessages: messages [
	<generated>
	^ RBCascadeNode new
		messages: messages;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createGlobalNodeWithName: name [
	^ self pharoCompatibilityRBFactory globalNamed: name
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createInstanceVariableNodeWithName: name [
	^ self pharoCompatibilityRBFactory instanceVariableNamed: name
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createLiteralArrayNodeWithContents: contents [
	^ RBLiteralArrayNode new
		contents: contents;
		isByteArray: contents class = ByteArray;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createLiteralValueNodeWithValue: value [
	<generated>
	^ RBLiteralValueNode new
		value: value;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createMessageNodeWithReceiver: receiver selector: selector arguments: arguments [
	<generated>
	^ RBMessageNode new
		receiver: receiver;
		selector: selector;
		arguments: arguments;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createMethodNodeWithSelector: selector body: body arguments: arguments pragmas: pragmas [
	<generated>
	^ RBMethodNode new
		selector: selector;
		body: body;
		arguments: arguments;
		pragmas: pragmas;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createPragmaNodeWithSelector: selector arguments: arguments [
	<generated>
	^ RBPragmaNode new
		selector: selector;
		arguments: arguments;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createReturnNodeWithValue: value [
	<generated>
	^ RBReturnNode new
		value: value;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createSelfNodeWithName: name [
	^ self pharoCompatibilityRBFactory selfNode
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createSequenceNodeWithStatements: statements temporaries: temporaries [
	<generated>
	^ RBSequenceNode new
		statements: statements;
		temporaries: temporaries;
		yourself
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createSuperNodeWithName: name [
	^ self pharoCompatibilityRBFactory superNode
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createTemporaryNodeWithName: name [
	^ self pharoCompatibilityRBFactory temporaryVariableNamed: name
]

{ #category : #factory }
PCGStaticConverterToRBAST >> createThisContextNodeWithName: name [
	^ self pharoCompatibilityRBFactory thisContextNode
]

{ #category : #factory }
PCGStaticConverterToRBAST >> pharoCompatibilityRBFactory [
	^ PCGPharoCompatibilityRBFactory availableFactory
]
