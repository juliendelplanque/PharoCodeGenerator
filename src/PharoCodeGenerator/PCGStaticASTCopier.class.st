"
I copy a PCG AST and create a fresh, identical, new AST from it.
"
Class {
	#name : #PCGStaticASTCopier,
	#superclass : #PCGVisitor,
	#category : #'PharoCodeGenerator-Visitors'
}

{ #category : #'methods generation' }
PCGStaticASTCopier class >> regenerateVisitMethods [
	<script>
	PCGProgramNode allSubclasses
		select: [ :c | c subclasses isEmpty ]
		thenCollect: [ :class | 
			| classNameWithoutPrefix argument |
			classNameWithoutPrefix := class name allButFirst: 3.
			argument := ((classNameWithoutPrefix first isVowel
				ifTrue: [ 'an' ]
				ifFalse: [ 'a' ]) , classNameWithoutPrefix) asSymbol asPCGArgument.
			(PCGMethodNode
				selector: ('visit' , (class name allButFirst: 3) , ':') asSymbol
				arguments: {argument})
				bodyBlock: [ :body | 
					| cascade |
					cascade := PCGCascadeNode
						target: class asPCG receiveNew.
					class allInstVarNames
						do: [ :instVarName | 
							((PCGTUnchangeableName users includesAny: class withAllSuperclasses) and: [ instVarName = #name ])
								ifFalse: [ 
									| visitingAst |
									visitingAst := (class slotNamed: instVarName) type class = CollectionOfType
										ifTrue: [ (argument receiveMessage: instVarName)
											receiveMessage: #collect:
											with:
												((PCGBlockNode arguments: {#toVisit asPCGArgument})
													bodyBlock: [ :blockBody | 
														blockBody
															<< (#self asPCGNode receiveMessage: #visit: with: #toVisit asPCGArgument) ]) ]
										ifFalse: [ 
											#self asPCGNode
												receiveMessage: #visit:
												with: (argument receiveMessage: instVarName) ].
							cascade receiveMessage: instVarName asMutator with: visitingAst ] ].
					cascade messages
						ifNotEmpty: [ cascade receiveYourself ]
						ifEmpty: [ cascade := cascade target ].
					body << cascade returnIt ];
				protocol: 'visiting';
				installOn: self ]
]

{ #category : #visiting }
PCGStaticASTCopier >> visit: anObject [
	"Here we consider that sometimes an attempt to visit a Symbol can be made to handle copy of PCGTemplateParameter.
	 If a symbol is passed, simply return it, like that this is transparent to user and harms no one.
	"
	anObject isSymbol
		ifTrue: [ ^ anObject ].
	
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
		variable: (self visit: anAssignmentNode variable);
		value: (self visit: anAssignmentNode value);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitBlockNode: aBlockNode [
	<generated>
	^ PCGBlockNode new
		arguments: (aBlockNode arguments collect: [ :toVisit | self visit: toVisit ]);
		body: (self visit: aBlockNode body);
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
		contents: (self visit: aLiteralArrayNode contents);
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
		selector: (self visit: aMessageNode selector);
		arguments: (aMessageNode arguments collect: [ :toVisit | self visit: toVisit ]);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitMethodNode: aMethodNode [
	<generated>
	^ PCGMethodNode new
		selector: (self visit: aMethodNode selector);
		body: (self visit: aMethodNode body);
		arguments: (aMethodNode arguments collect: [ :toVisit | self visit: toVisit ]);
		pragmas: (aMethodNode pragmas collect: [ :toVisit | self visit: toVisit ]);
		protocol: (self visit: aMethodNode protocol);
		yourself
]

{ #category : #visiting }
PCGStaticASTCopier >> visitPragmaNode: aPragmaNode [
	<generated>
	^ PCGPragmaNode new
		selector: (self visit: aPragmaNode selector);
		arguments: (aPragmaNode arguments collect: [ :toVisit | self visit: toVisit ]);
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
	<generated>
	^ PCGTemplateParameter new
		name: (self visit: aTemplateParameter name);
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
