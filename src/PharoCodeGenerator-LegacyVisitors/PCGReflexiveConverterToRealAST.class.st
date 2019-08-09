"
I convert a PCG AST as a Pharo real AST.
"
Class {
	#name : #PCGReflexiveConverterToRealAST,
	#superclass : #PCGGenericVisitor,
	#category : #'PharoCodeGenerator-LegacyVisitors'
}

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitProgramNode: aProgramNode [
	|realASTNode|
	realASTNode := aProgramNode classForRealAST new.
	(realASTNode isKindOf: RBVariableNode)
		ifTrue: [ realASTNode start: 0 ].
	aProgramNode instanceVariablesForRealAST do: [ :instVarName |
		|subNode realSubNode|
		subNode := instVarName value: aProgramNode.
		realSubNode := (subNode isKindOf: PCGProgramNode)
			ifTrue: [ 
				(self visit: subNode)
					parent: realASTNode;
					yourself ]
			ifFalse: [ 
				(subNode isKindOf: OrderedCollection)
					ifTrue: [ 
						subNode collect: [ :subsubNode | 
							(self visit: subsubNode)
								parent: realASTNode;
								yourself ] ]
				ifFalse: [ subNode ] ].
		realASTNode
			perform: instVarName asMutator
			with: realSubNode ].
	^ realASTNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitTemplateParameter: aTemplateParameter [
	self error: 'Attempt to convert template AST to real source code.'
]
