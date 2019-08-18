Extension { #name : #PCGStaticConverterToRBAST }

{ #category : #'*PharoCodeGenerator-Meta' }
PCGStaticConverterToRBAST class >> regenerateFactoryMethods [
	<script>
	<metaprogramming>
	PCGProgramNode allSubclasses \ {PCGTemplateParameter}
		select: [ :c | c package = PCGProgramNode package and: [ c subclasses isEmpty ] ]
		thenDo: [ :class |
			|selectorKeywords arguments|
			selectorKeywords := self buildFactoryMethodSelectorKeywordsFor: class.
			arguments := class instanceVariablesForRealAST collect: [ :instVarName |
				instVarName asPCGArgument ].
			(PCGMethodNode
				selectorKeywords: selectorKeywords
				arguments: arguments)
				bodyBlock: [ :body | 
					| cascade |
					cascade := PCGCascadeNode target: class classForRealAST asPCG receiveNew.
					(class classForRealAST inheritsFrom: RBVariableNode)
						ifTrue: [ cascade receiveMessage: #start: with: 0 asPCG ].
					class instanceVariablesForRealAST
						do: [ :instVarName | 
							cascade receiveMessage: instVarName asMutator with: instVarName asPCGArgument ].
					cascade receiveYourself.
					body << cascade returnIt ];
				protocol: 'factory';
				installOn: self ]
]
