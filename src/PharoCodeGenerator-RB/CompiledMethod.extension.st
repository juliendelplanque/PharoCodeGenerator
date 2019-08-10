Extension { #name : #CompiledMethod }

{ #category : #'*PharoCodeGenerator-RB' }
CompiledMethod >> asPCGAST [
	"Convert Pharo's AST nodes to PCG nodes and return it."
	^ (PCGRealASTToPCGConverter visit: self parseTree doSemanticAnalysis)
		protocol: self protocol;
		yourself
]
