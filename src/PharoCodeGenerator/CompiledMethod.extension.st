Extension { #name : #CompiledMethod }

{ #category : #'*PharoCodeGenerator' }
CompiledMethod >> asPCG [
	^ self methodClass asPCG
		receiveMessage: #>> with: self selector asPCG
]

{ #category : #'*PharoCodeGenerator' }
CompiledMethod >> asPCGAST [
	"Convert Pharo's AST nodes to PCG nodes and return it."
	^ (PCGRealASTToPCGConverter visit: self parseTree doSemanticAnalysis)
		protocol: self protocol;
		yourself
]
