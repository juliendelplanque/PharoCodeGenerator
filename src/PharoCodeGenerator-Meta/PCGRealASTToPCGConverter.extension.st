Extension { #name : #PCGRealASTToPCGConverter }

{ #category : #'*PharoCodeGenerator-Meta' }
PCGRealASTToPCGConverter class >> regenerateVisitMethods [
	<script>
	<metaprogramming>
	PCGProgramNode allSubclasses \ {PCGTemplateParameter. PCGCompositeTemplateParameter}
		select:
			[ :c | c package = PCGProgramNode package and: [ c subclasses isEmpty ] ]
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
					cascade := PCGCascadeNode target: class asPCG receiveNew.
					class instanceVariablesForRealAST
						do: [ :instVarName | 
							| visitingAst |
							visitingAst := (class slotNamed: instVarName) type class
								= CollectionOfType
								ifTrue: [ (argument receiveMessage: instVarName)
										receiveMessage: #collect:
										with:
											((PCGBlockNode arguments: {#toVisit asPCGArgument})
												bodyBlock: [ :blockBody | 
													blockBody
														<< (#self asPCGNode receiveMessage: #visit: with: #toVisit asPCGArgument) ]) ]
								ifFalse: [ ((class slotNamed: instVarName) type inheritsFrom: PCGProgramNode)
										ifTrue: [ #self asPCGNode
												receiveMessage: #visit:
												with: (argument receiveMessage: instVarName) ]
										ifFalse: [ argument receiveMessage: instVarName ] ].
							cascade receiveMessage: instVarName asMutator with: visitingAst ].
					cascade receiveYourself.
					body << cascade returnIt ];
				protocol: 'visiting';
				installOn: self
					ifHandwrittenMethodAlreadyExist:
						[ :e | (e method printString , ' already exist, do not modify it') traceCr ] ]
]
