Class {
	#name : #PCGStaticConverterToRealAST,
	#superclass : #PCGGenericVisitor,
	#category : #'PharoCodeGenerator-Visitors'
}

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitArgumentNode: anArgumentNode [
	<generated>
	^ anArgumentNode classForRealAST new
		start: 0;
		name: anArgumentNode name;
		yourself
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitArrayNode: anArrayNode [
	<generated>
	^ anArrayNode classForRealAST new
		statements: (anArrayNode statements collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitAssignmentNode: anAssignmentNode [
	<generated>
	^ anAssignmentNode classForRealAST new
		variable: (self visit: anAssignmentNode variable);
		value: (self visit: anAssignmentNode value);
		yourself
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitBlockNode: aBlockNode [
	<generated>
	^ aBlockNode classForRealAST new
		arguments: (aBlockNode arguments collect: [ :toVisit | self visit: toVisit ]);
		body: (self visit: aBlockNode body);
		yourself
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitCascadeNode: aCascadeNode [
	<generated>
	^ aCascadeNode classForRealAST new
		messages: (aCascadeNode messages collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitGlobalNode: aGlobalNode [
	<generated>
	^ aGlobalNode classForRealAST new
		start: 0;
		name: aGlobalNode name;
		yourself
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitInstanceVariableNode: anInstanceVariableNode [
	<generated>
	^ anInstanceVariableNode classForRealAST new
		start: 0;
		name: anInstanceVariableNode name;
		yourself
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitLiteralArrayNode: aLiteralArrayNode [
	<generated>
	^ aLiteralArrayNode classForRealAST new
		contents: (self visit: aLiteralArrayNode contents);
		yourself
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitLiteralValueNode: aLiteralValueNode [
	<generated>
	^ aLiteralValueNode classForRealAST new
		value: aLiteralValueNode value;
		yourself
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitMessageNode: aMessageNode [
	<generated>
	^ aMessageNode classForRealAST new
		receiver: (self visit: aMessageNode receiver);
		selector: aMessageNode selector;
		arguments: (aMessageNode arguments collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitMethodNode: aMethodNode [
	<generated>
	^ aMethodNode classForRealAST new
		selector: aMethodNode selector;
		body: (self visit: aMethodNode body);
		arguments: (aMethodNode arguments collect: [ :toVisit | self visit: toVisit ]);
		pragmas: (aMethodNode pragmas collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitPragmaNode: aPragmaNode [
	<generated>
	^ aPragmaNode classForRealAST new
		selector: aPragmaNode selector;
		arguments: (aPragmaNode arguments collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitProgramNode: aProgramNode [
	"This node should never be visited since it is abstract."
	^ self shouldNotImplement
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitReturnNode: aReturnNode [
	<generated>
	^ aReturnNode classForRealAST new
		value: (self visit: aReturnNode value);
		yourself
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitSelfNode: aSelfNode [
	<generated>
	^ aSelfNode classForRealAST new
		start: 0;
		name: aSelfNode name;
		yourself
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitSequenceNode: aSequenceNode [
	<generated>
	^ aSequenceNode classForRealAST new
		statements: (aSequenceNode statements collect: [ :toVisit | self visit: toVisit ]);
		temporaries: (aSequenceNode temporaries collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitSuperNode: aSuperNode [
	<generated>
	^ aSuperNode classForRealAST new
		start: 0;
		name: aSuperNode name;
		yourself
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitTemporaryNode: aTemporaryNode [
	<generated>
	^ aTemporaryNode classForRealAST new
		start: 0;
		name: aTemporaryNode name;
		yourself
]

{ #category : #visiting }
PCGStaticConverterToRealAST >> visitThisContextNode: aThisContextNode [
	<generated>
	^ aThisContextNode classForRealAST new
		start: 0;
		name: aThisContextNode name;
		yourself
]
