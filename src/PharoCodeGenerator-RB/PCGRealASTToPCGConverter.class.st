Class {
	#name : #PCGRealASTToPCGConverter,
	#superclass : #RBProgramNodeVisitor,
	#category : #'PharoCodeGenerator-RB'
}

{ #category : #visiting }
PCGRealASTToPCGConverter class >> visit: aProgramNode [
	^ self new visit: aProgramNode
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visit: aProgramNode [
	^ aProgramNode acceptVisitor: self
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitArgumentNode: anArgumentNode [
	<generated>
	^ PCGArgumentNode new
		name: anArgumentNode name;
		yourself
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitArrayNode: anArrayNode [
	<generated>
	^ PCGArrayNode new
		statements: (anArrayNode statements collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitAssignmentNode: anAssignmentNode [
	<generated>
	^ PCGAssignmentNode new
		variable: (self visit: anAssignmentNode variable);
		value: (self visit: anAssignmentNode value);
		yourself
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitBlockNode: aBlockNode [
	<generated>
	^ PCGBlockNode new
		arguments: (aBlockNode arguments collect: [ :toVisit | self visit: toVisit ]);
		body: (self visit: aBlockNode body);
		yourself
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitCascadeNode: aCascadeNode [
	|messages|
	messages := aCascadeNode messages collect: [ :toVisit | self visit: toVisit ].
	^ PCGCascadeNode new
		messages: messages;
		target: messages anyOne receiver;
		yourself
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitGlobalNode: aGlobalNode [
	<generated>
	^ PCGGlobalNode new
		name: aGlobalNode name;
		yourself
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitInstanceVariableNode: anInstanceVariableNode [
	<generated>
	^ PCGInstanceVariableNode new
		name: anInstanceVariableNode name;
		yourself
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitLiteralArrayNode: aLiteralArrayNode [
	<generated>
	^ PCGLiteralArrayNode new
		contents:
			(aLiteralArrayNode contents
				collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitLiteralNode: aLiteralNode [
	self flag: #TODO. "Should be generated"
    ^ aLiteralNode value
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitLiteralValueNode: aLiteralValueNode [
	<generated>
	^ PCGLiteralValueNode new
		value: aLiteralValueNode value;
		yourself
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitMessageNode: aMessageNode [
	<generated>
	^ PCGMessageNode new
		receiver: (self visit: aMessageNode receiver);
		selector: aMessageNode selector;
		arguments: (aMessageNode arguments collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitMethodNode: aMethodNode [
	<generated>
	^ PCGMethodNode new
		selector: aMethodNode selector;
		body: (self visit: aMethodNode body);
		arguments: (aMethodNode arguments collect: [ :toVisit | self visit: toVisit ]);
		pragmas: (aMethodNode pragmas collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitPragmaNode: aPragmaNode [
	<generated>
	^ PCGPragmaNode new
		selector: aPragmaNode selector;
		arguments: (aPragmaNode arguments collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitReturnNode: aReturnNode [
	<generated>
	^ PCGReturnNode new
		value: (self visit: aReturnNode value);
		yourself
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitSelfNode: aSelfNode [
	^ PCGSelfNode new
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitSequenceNode: aSequenceNode [
	<generated>
	^ PCGSequenceNode new
		statements: (aSequenceNode statements collect: [ :toVisit | self visit: toVisit ]);
		temporaries: (aSequenceNode temporaries collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitSuperNode: aSuperNode [
	^ PCGSuperNode new
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitTemporaryNode: aTemporaryNode [
	<generated>
	^ PCGTemporaryNode new
		name: aTemporaryNode name;
		yourself
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitThisContextNode: aThisContextNode [
	^ PCGThisContextNode new
]

{ #category : #visiting }
PCGRealASTToPCGConverter >> visitVariableNode: aVariableNode [
	self error: 'The AST to convert should not contain variable node. You need to perform semantic analysis on it.'
]
