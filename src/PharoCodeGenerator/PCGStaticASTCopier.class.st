"
I copy a PCG AST and create a fresh, identical, new AST from it.
"
Class {
	#name : #PCGStaticASTCopier,
	#superclass : #PCGVisitor,
	#category : #'PharoCodeGenerator-Visitors'
}

{ #category : #visiting }
PCGStaticASTCopier >> visit: anObject [
	"Here we consider that sometimes an attempt to visit a Symbol can be made to handle copy of PCGTemplateParameter.
	 If a symbol is passed, simply return it, like that this is transparent to user and harms no one.
	"
	anObject isPCGObject
		ifFalse: [ ^ anObject copy ].
	
	^ anObject acceptVisitor: self
]

{ #category : #visiting }
PCGStaticASTCopier >> visitArgumentNode: anArgumentNode [
	<generated>
	^ PCGArgumentNode new
		name: (self visit: anArgumentNode name);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitArrayNode: anArrayNode [
	<generated>
	^ PCGArrayNode new
		statements: (anArrayNode statements collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitAssignmentNode: anAssignmentNode [
	<generated>
	^ PCGAssignmentNode new
		value: (self visit: anAssignmentNode value);
		variable: (self visit: anAssignmentNode variable);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitBlockNode: aBlockNode [
	<generated>
	^ PCGBlockNode new
		body: (self visit: aBlockNode body);
		arguments: (aBlockNode arguments collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitCascadeNode: aCascadeNode [
	<generated>
	^ PCGCascadeNode new
		target: (self visit: aCascadeNode target);
		messages: (aCascadeNode messages collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitCompositeTemplateParameter: aCompositeTemplateParameter [
	<generated>
	^ PCGCompositeTemplateParameter new
		transformationBlock: (self visit: aCompositeTemplateParameter transformationBlock);
		templateParameters:
			(aCompositeTemplateParameter templateParameters
				collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitExtensionMethod: anExtensionMethod [
	<generated>
	^ PCGExtensionMethod new
		methodNode: (self visit: anExtensionMethod methodNode);
		installationTarget: (self visit: anExtensionMethod installationTarget);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitGlobalNode: aGlobalNode [
	<generated>
	^ PCGGlobalNode new
		name: (self visit: aGlobalNode name);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitInstanceVariableNode: anInstanceVariableNode [
	<generated>
	^ PCGInstanceVariableNode new
		name: (self visit: anInstanceVariableNode name);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitLiteralArrayNode: aLiteralArrayNode [
	<generated>
	^ PCGLiteralArrayNode new
		contents:
			(aLiteralArrayNode contents
				collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitLiteralValueNode: aLiteralValueNode [
	<generated>
	^ PCGLiteralValueNode new
		value: (self visit: aLiteralValueNode value);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitMessageNode: aMessageNode [
	<generated>
	^ PCGMessageNode new
		receiver: (self visit: aMessageNode receiver);
		arguments: (aMessageNode arguments collect: [ :toVisit | self visit: toVisit ]);
		selector: (self visit: aMessageNode selector);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitMethodNode: aMethodNode [
	<generated>
	^ PCGMethodNode new
		body: (self visit: aMethodNode body);
		selector: (self visit: aMethodNode selector);
		arguments: (aMethodNode arguments collect: [ :toVisit | self visit: toVisit ]);
		protocol: (self visit: aMethodNode protocol);
		pragmas: (aMethodNode pragmas collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitPragmaNode: aPragmaNode [
	<generated>
	^ PCGPragmaNode new
		arguments: (aPragmaNode arguments collect: [ :toVisit | self visit: toVisit ]);
		selector: (self visit: aPragmaNode selector);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitReturnNode: aReturnNode [
	<generated>
	^ PCGReturnNode new
		value: (self visit: aReturnNode value);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitSelfNode: aSelfNode [
	<generated>
	^ PCGSelfNode new
]

{ #category : #visiting }
PCGStaticASTCopier >> visitSequenceNode: aSequenceNode [
	<generated>
	^ PCGSequenceNode new
		statements: (aSequenceNode statements collect: [ :toVisit | self visit: toVisit ]);
		temporaries: (aSequenceNode temporaries collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitSuperNode: aSuperNode [
	<generated>
	^ PCGSuperNode new
]

{ #category : #visiting }
PCGStaticASTCopier >> visitTemplateParameter: aTemplateParameter [
	^ PCGTemplateParameter new
		name: (self visit: aTemplateParameter name);
		transformationBlock: aTemplateParameter transformationBlock;
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitTemporaryNode: aTemporaryNode [
	<generated>
	^ PCGTemporaryNode new
		name: (self visit: aTemporaryNode name);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitThisContextNode: aThisContextNode [
	<generated>
	^ PCGThisContextNode new
]
