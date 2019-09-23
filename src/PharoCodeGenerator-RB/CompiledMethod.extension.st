Extension { #name : #CompiledMethod }

{ #category : #'*PharoCodeGenerator-RB' }
CompiledMethod >> asPCGAST [
	"Convert Pharo's AST nodes to PCG nodes and return it."
	^ self parseTree doSemanticAnalysis asPCGAST
		protocol: self protocol;
		yourself
]
