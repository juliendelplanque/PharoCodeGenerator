Extension { #name : #PCGStaticASTCopier }

{ #category : #'*PharoCodeGenerator-Meta' }
PCGStaticASTCopier class >> regenerateVisitMethods [
	<script>
	<metaprogramming>
	PCGProgramNode allSubclasses , { PCGExtensionMethod } \ {PCGTemplateParameter}
		select: [ :c | c package = PCGProgramNode package and: [ c subclasses isEmpty ] ]
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
					class allInstVarNames \ { #installationHooks. #parent }
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
