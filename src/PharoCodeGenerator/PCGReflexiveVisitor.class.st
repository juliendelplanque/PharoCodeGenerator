Class {
	#name : #PCGReflexiveVisitor,
	#superclass : #PCGVisitor,
	#category : #'PharoCodeGenerator-Visitors'
}

{ #category : #visiting }
PCGReflexiveVisitor >> visitArgumentNode: aArgumentNode [
	^ self visitProgramNode: aArgumentNode
]

{ #category : #visiting }
PCGReflexiveVisitor >> visitArrayNode: aArrayNode [
	^ self visitProgramNode: aArrayNode
]

{ #category : #visiting }
PCGReflexiveVisitor >> visitAssignmentNode: aAssignmentNode [
	^ self visitProgramNode: aAssignmentNode
]

{ #category : #visiting }
PCGReflexiveVisitor >> visitBlockNode: aBlockNode [
	^ self visitProgramNode: aBlockNode
]

{ #category : #visiting }
PCGReflexiveVisitor >> visitCascadeNode: aCascadeNode [
	^ self visitProgramNode: aCascadeNode
]

{ #category : #visiting }
PCGReflexiveVisitor >> visitGlobalNode: aGlobalNode [
	^ self visitProgramNode: aGlobalNode
]

{ #category : #visiting }
PCGReflexiveVisitor >> visitInstanceVariableNode: aInstanceVariableNode [
	^ self visitProgramNode: aInstanceVariableNode
]

{ #category : #visiting }
PCGReflexiveVisitor >> visitLiteralArrayNode: aLiteralArrayNode [
	^ self visitProgramNode: aLiteralArrayNode
]

{ #category : #visiting }
PCGReflexiveVisitor >> visitLiteralValueNode: aLiteralValueNode [
	^ self visitProgramNode: aLiteralValueNode
]

{ #category : #visiting }
PCGReflexiveVisitor >> visitMessageNode: aMessageNode [
	^ self visitProgramNode: aMessageNode
]

{ #category : #visiting }
PCGReflexiveVisitor >> visitMethodNode: aMethodNode [
	^ self visitProgramNode: aMethodNode
]

{ #category : #visiting }
PCGReflexiveVisitor >> visitPragmaNode: aPragmaNode [
	^ self visitProgramNode: aPragmaNode
]

{ #category : #visiting }
PCGReflexiveVisitor >> visitReturnNode: aReturnNode [
	^ self visitProgramNode: aReturnNode
]

{ #category : #visiting }
PCGReflexiveVisitor >> visitSelfNode: aSelfNode [
	^ self visitProgramNode: aSelfNode
]

{ #category : #visiting }
PCGReflexiveVisitor >> visitSequenceNode: aSequenceNode [
	^ self visitProgramNode: aSequenceNode
]

{ #category : #visiting }
PCGReflexiveVisitor >> visitSuperNode: aSuperNode [
	^ self visitProgramNode: aSuperNode
]

{ #category : #visiting }
PCGReflexiveVisitor >> visitTemporaryNode: aTemporaryNode [
	^ self visitProgramNode: aTemporaryNode
]

{ #category : #visiting }
PCGReflexiveVisitor >> visitThisContextNode: aThisContextNode [
	^ self visitProgramNode: aThisContextNode
]
