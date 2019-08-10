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
	(aMethodOrMessageNode selector allSatisfy: #isSpecial)
		ifTrue: [
			self checkMethodOrMessageNodeWithBinarySelector: aMethodOrMessageNode.
			^ self ].

	"Other selectors."
	self checkMethodOrMessageNodeWithNormalSelector: aMethodOrMessageNode
]

{ #category : #visiting }
PCGASTChecker >> checkMethodOrMessageNodeWithBinarySelector: aMethodOrMessageNode [
	aMethodOrMessageNode arguments size = 1
		ifFalse: [
			PCGASTInvalidForTranslation
				signal: 'Inconsistent number of arguments compared to method selector.' ]
]

{ #category : #visiting }
PCGASTChecker >> checkMethodOrMessageNodeWithNormalSelector: aMethodOrMessageNode [
	(aMethodOrMessageNode selector count: [ :c | c = $: ])
		~= aMethodOrMessageNode arguments size
		ifTrue: [ PCGASTInvalidForTranslation
				signal: 'Inconsistent number of arguments compared to method selector.' ]
]

{ #category : #visiting }
PCGASTChecker >> visitCascadeNode: aCascadeNode [
	super visitCascadeNode: aCascadeNode.
	aCascadeNode messages ifEmpty: [ PCGASTInvalidForTranslation signal: 'A cascade can not be empty.' ]
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
		((instVarName value: aProgramNode) isNil and: [ aProgramNode class ~= PCGLiteralValueNode ])
			ifTrue: [ (PCGASTIncompleteForTranslation node: aProgramNode unsetInstanceVariable: instVarName) signal ]
		 ].
	"Type-check the AST."
	aProgramNode class allSlots select: #isTypedSlot thenDo: [ :slot |
		slot checkTypeOfCurrentValueFor: aProgramNode.
		slot type class = CollectionOfType
			ifTrue: [ (slot read: aProgramNode) do: [ :toVisit | self visit: toVisit ] ]
			ifFalse: [ 
				(slot type inheritsFrom: PCGProgramNode)
					ifTrue: [ self visit: (slot read: aProgramNode) ] ] ].
]

{ #category : #visiting }
PCGASTChecker >> visitTemplateParameter: aTemplateParameter [
	PCGASTInvalidForTranslation signal: 'The AST still contains a template parameter and is thus not ready for conversion to real AST.'
]
