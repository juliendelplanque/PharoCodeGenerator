Extension { #name : #PCGStaticParametersReplacer }

{ #category : #'*PharoCodeGenerator-Meta' }
PCGStaticParametersReplacer class >> regenerateVisitMethods [
	<script>
	<metaprogramming>
	PCGProgramNode allSubclasses
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
