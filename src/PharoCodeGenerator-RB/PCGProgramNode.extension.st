Extension { #name : #PCGProgramNode }

{ #category : #'*PharoCodeGenerator-RB' }
PCGProgramNode class >> classForRealAST [
	^ RBProgramNode
]

{ #category : #'*PharoCodeGenerator-RB' }
PCGProgramNode >> realAST [
	self checkAST.
	^ PCGStaticConverterToRBAST visit: self
]
