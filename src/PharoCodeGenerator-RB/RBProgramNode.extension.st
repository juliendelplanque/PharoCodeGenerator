Extension { #name : #RBProgramNode }

{ #category : #'*PharoCodeGenerator-RB' }
RBProgramNode >> asPCGAST [
	"Convert Pharo's AST nodes to PCG nodes and return it."
	^ PCGRealASTToPCGConverter visit: self
]
