Class {
	#name : #PCGReflexiveConverterToRealAST,
	#superclass : #PCGVisitor,
	#category : #'PharoCodeGenerator-Visitors'
}

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visit: anObject [
	^ anObject acceptVisitor: self
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitArgumentNode: aArgumentNode [
	^ self visitProgramNode: aArgumentNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitArrayNode: aArrayNode [
	^ self visitProgramNode: aArrayNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitAssignmentNode: aAssignmentNode [
	^ self visitProgramNode: aAssignmentNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitBlockNode: aBlockNode [
	^ self visitProgramNode: aBlockNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitCascadeNode: aCascadeNode [
	^ self visitProgramNode: aCascadeNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitGlobalNode: aGlobalNode [
	^ self visitProgramNode: aGlobalNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitInstanceVariableNode: aInstanceVariableNode [
	^ self visitProgramNode: aInstanceVariableNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitLiteralArrayNode: aLiteralArrayNode [
	^ self visitProgramNode: aLiteralArrayNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitLiteralNode: aLiteralNode [
	^ self visitProgramNode: aLiteralNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitLiteralValueNode: aLiteralValueNode [
	^ self visitProgramNode: aLiteralValueNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitMessageNode: aMessageNode [
	^ self visitProgramNode: aMessageNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitMethodNode: aMethodNode [
	^ self visitProgramNode: aMethodNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitPragmaNode: aPragmaNode [
	^ self visitProgramNode: aPragmaNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitProgramNode: aProgramNode [
	|realASTNode|
	realASTNode := aProgramNode classForRealAST new.
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
PCGReflexiveConverterToRealAST >> visitReturnNode: aReturnNode [
	^ self visitProgramNode: aReturnNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitSelfNode: aSelfNode [
	^ self visitProgramNode: aSelfNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitSequenceNode: aSequenceNode [
	^ self visitProgramNode: aSequenceNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitSuperNode: aSuperNode [
	^ self visitProgramNode: aSuperNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitTemporaryNode: aTemporaryNode [
	^ self visitProgramNode: aTemporaryNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitThisContextNode: aThisContextNode [
	^ self visitProgramNode: aThisContextNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitValueNode: aValueNode [
	^ self visitProgramNode: aValueNode
]

{ #category : #visiting }
PCGReflexiveConverterToRealAST >> visitVariableNode: aVariableNode [
	^ self visitProgramNode: aVariableNode
]
