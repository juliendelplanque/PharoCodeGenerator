"
I ensure that the PCG AST is ready to be converted to a real AST.
"
Class {
	#name : #PCGASTChecker,
	#superclass : #PCGGenericVisitor,
	#category : #'PharoCodeGenerator-Visitors'
}

{ #category : #visiting }
PCGASTChecker >> checkMethodOrMessageNode: aMethodOrMessageNode [
	"Binary selector"
	(((aMethodOrMessageNode selector allSatisfy: #isSpecial) and: [ aMethodOrMessageNode arguments size = 1 ]) or: [ "Other selectors."
		(aMethodOrMessageNode selector count: [ :c | c = $: ]) = aMethodOrMessageNode arguments size ])
			ifFalse: [ 
				PCGASTInvalidForTranslation
					signal: 'Inconsistent number of arguments compared to method selector.' ]
]

{ #category : #visiting }
PCGASTChecker >> visitMessageNode: aMessageNode [
	self checkMethodOrMessageNode: aMessageNode.
	^ super visitMessageNode: aMessageNode.
]

{ #category : #visiting }
PCGASTChecker >> visitMethodNode: aMethodNode [
	self checkMethodOrMessageNode: aMethodNode.
	^ super visitMethodNode: aMethodNode.
]

{ #category : #visiting }
PCGASTChecker >> visitPragmaNode: aMessageNode [
	self checkMethodOrMessageNode: aMessageNode.
	^ super visitPragmaNode: aMessageNode.
]

{ #category : #visiting }
PCGASTChecker >> visitProgramNode: aProgramNode [
	aProgramNode instanceVariablesForRealAST do: [ :instVarName |
		(instVarName value: aProgramNode) ifNil: [ 
			(PCGASTIncompleteForTranslation node: self unsetInstanceVariable: instVarName) signal ]
		 ].
	"Type-check the AST."
	aProgramNode class slots select: #isTypedSlot thenDo: [ :slot |
		slot checkTypeOfCurrentValueFor: aProgramNode ]
]

{ #category : #visiting }
PCGASTChecker >> visitTemplateParameter: aTemplateParameter [
	PCGASTInvalidForTranslation signal: 'The AST still contains a template parameter and is thus not ready for conversion to real AST.'
]
