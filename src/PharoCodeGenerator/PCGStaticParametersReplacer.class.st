"
I substitute PCGTemplateParameterNodes with objects for which its key is equal to the template parameter name in my #context.
"
Class {
	#name : #PCGStaticParametersReplacer,
	#superclass : #PCGStaticASTCopier,
	#instVars : [
		'context'
	],
	#category : #'PharoCodeGenerator-Visitors'
}

{ #category : #'methods generation' }
PCGStaticParametersReplacer class >> regenerateVisitMethods [
	<script>
	<metaprogramming>
	PCGProgramNode allSubclasses \ {PCGTemplateParameter}
		select: [ :c | c package = PCGProgramNode package and: [ c subclasses isEmpty ] ]
		thenDo: [ :class | 
			| classNameWithoutPrefix argument shouldInstall|
			classNameWithoutPrefix := class name allButFirst: 3.
			argument := ((classNameWithoutPrefix first isVowel
				ifTrue: [ 'an' ]
				ifFalse: [ 'a' ]) , classNameWithoutPrefix) asSymbol asPCGArgument.
			shouldInstall := false.
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
										ifTrue: [ shouldInstall := true.
										((argument receiveMessage: instVarName)
											receiveMessage: #collect:
											with:
												((PCGBlockNode arguments: {#toVisit asPCGArgument})
													bodyBlock: [ :blockBody | 
														blockBody
															<< (#self asPCGNode receiveMessage: #visit: with: #toVisit asPCGArgument) ])) receiveMessage: #flattened ]
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
				in: [ :method | 
					shouldInstall ifTrue: [ method installOn: self ] ] ]
]

{ #category : #accessing }
PCGStaticParametersReplacer >> context [
	^ context
]

{ #category : #accessing }
PCGStaticParametersReplacer >> context: anObject [
	context := anObject
]

{ #category : #visiting }
PCGStaticParametersReplacer >> visitArrayNode: anArrayNode [
	<generated>
	^ PCGArrayNode new
		statements:
			(anArrayNode statements collect: [ :toVisit | self visit: toVisit ])
				flattened;
		yourself
]

{ #category : #visiting }
PCGStaticParametersReplacer >> visitBlockNode: aBlockNode [
	<generated>
	^ PCGBlockNode new
		arguments:
			(aBlockNode arguments collect: [ :toVisit | self visit: toVisit ])
				flattened;
		body: (self visit: aBlockNode body);
		yourself
]

{ #category : #visiting }
PCGStaticParametersReplacer >> visitCascadeNode: aCascadeNode [
	<generated>
	^ PCGCascadeNode new
		target: (self visit: aCascadeNode target);
		messages:
			(aCascadeNode messages collect: [ :toVisit | self visit: toVisit ])
				flattened;
		yourself
]

{ #category : #visiting }
PCGStaticParametersReplacer >> visitLiteralArrayNode: aLiteralArrayNode [
	<generated>
	^ PCGLiteralArrayNode new
		contents:
			(aLiteralArrayNode contents
				collect: [ :toVisit | self visit: toVisit ]) flattened;
		yourself
]

{ #category : #visiting }
PCGStaticParametersReplacer >> visitMessageNode: aMessageNode [
	<generated>
	^ PCGMessageNode new
		receiver: (self visit: aMessageNode receiver);
		selector: (self visit: aMessageNode selector);
		arguments:
			(aMessageNode arguments collect: [ :toVisit | self visit: toVisit ])
				flattened;
		yourself
]

{ #category : #visiting }
PCGStaticParametersReplacer >> visitMethodNode: aMethodNode [
	<generated>
	^ PCGMethodNode new
		selector: (self visit: aMethodNode selector);
		body: (self visit: aMethodNode body);
		arguments:
			(aMethodNode arguments collect: [ :toVisit | self visit: toVisit ])
				flattened;
		pragmas:
			(aMethodNode pragmas collect: [ :toVisit | self visit: toVisit ])
				flattened;
		protocol: (self visit: aMethodNode protocol);
		yourself
]

{ #category : #visiting }
PCGStaticParametersReplacer >> visitPragmaNode: aPragmaNode [
	<generated>
	^ PCGPragmaNode new
		selector: (self visit: aPragmaNode selector);
		arguments:
			(aPragmaNode arguments collect: [ :toVisit | self visit: toVisit ])
				flattened;
		yourself
]

{ #category : #visiting }
PCGStaticParametersReplacer >> visitSequenceNode: aSequenceNode [
	<generated>
	^ PCGSequenceNode new
		statements:
			(aSequenceNode statements collect: [ :toVisit | self visit: toVisit ])
				flattened;
		temporaries:
			(aSequenceNode temporaries collect: [ :toVisit | self visit: toVisit ])
				flattened;
		yourself
]

{ #category : #visiting }
PCGStaticParametersReplacer >> visitTemplateParameter: aTemplateParameter [
	^ self context
		at: aTemplateParameter name
		ifPresent: [ :toInject | 
			PCGStaticASTCopier visit: (aTemplateParameter transform: toInject) ]
		ifAbsent: [ self error: 'Template parameter not found in the context: #' , aTemplateParameter name ]
]
