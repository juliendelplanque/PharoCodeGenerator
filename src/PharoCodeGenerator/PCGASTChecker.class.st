"
I ensure that the PCG AST is ready to be converted to a real AST.
"
Class {
	#name : #PCGASTChecker,
	#superclass : #PCGReflexiveVisitor,
	#category : #'PharoCodeGenerator-Visitors'
}

{ #category : #visiting }
PCGASTChecker >> visitProgramNode: aProgramNode [
	aProgramNode instanceVariablesForRealAST do: [ :instVarName |
		(instVarName value: aProgramNode) ifNil: [ 
			(PCGASTIncompleteForTranslation node: self unsetInstanceVariable: instVarName) signal ]
		 ].
]
