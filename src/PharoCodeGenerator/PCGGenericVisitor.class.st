"
I use #visitProgramNode: to visit any kind of node of the AST.
"
Class {
	#name : #PCGGenericVisitor,
	#superclass : #PCGVisitor,
	#category : #'PharoCodeGenerator-Visitors'
}

{ #category : #visiting }
PCGGenericVisitor >> visitArgumentNode: aArgumentNode [
	^ self visitProgramNode: aArgumentNode
]

{ #category : #visiting }
PCGGenericVisitor >> visitArrayNode: aArrayNode [
	^ self visitProgramNode: aArrayNode
]

{ #category : #visiting }
PCGGenericVisitor >> visitAssignmentNode: aAssignmentNode [
	^ self visitProgramNode: aAssignmentNode
]

{ #category : #visiting }
PCGGenericVisitor >> visitBlockNode: aBlockNode [
	^ self visitProgramNode: aBlockNode
]

{ #category : #visiting }
PCGGenericVisitor >> visitCascadeNode: aCascadeNode [
	^ self visitProgramNode: aCascadeNode
]

{ #category : #visiting }
PCGGenericVisitor >> visitGlobalNode: aGlobalNode [
	^ self visitProgramNode: aGlobalNode
]

{ #category : #visiting }
PCGGenericVisitor >> visitInstanceVariableNode: aInstanceVariableNode [
	^ self visitProgramNode: aInstanceVariableNode
]

{ #category : #visiting }
PCGGenericVisitor >> visitLiteralArrayNode: aLiteralArrayNode [
	^ self visitProgramNode: aLiteralArrayNode
]

{ #category : #visiting }
PCGGenericVisitor >> visitLiteralValueNode: aLiteralValueNode [
	^ self visitProgramNode: aLiteralValueNode
]

{ #category : #visiting }
PCGGenericVisitor >> visitMessageNode: aMessageNode [
	^ self visitProgramNode: aMessageNode
]

{ #category : #visiting }
PCGGenericVisitor >> visitMethodNode: aMethodNode [
	^ self visitProgramNode: aMethodNode
]

{ #category : #visiting }
PCGGenericVisitor >> visitPragmaNode: aPragmaNode [
	^ self visitProgramNode: aPragmaNode
]

{ #category : #visiting }
PCGGenericVisitor >> visitProgramNode: aProgramNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
PCGGenericVisitor >> visitReturnNode: aReturnNode [
	^ self visitProgramNode: aReturnNode
]

{ #category : #visiting }
PCGGenericVisitor >> visitSelfNode: aSelfNode [
	^ self visitProgramNode: aSelfNode
]

{ #category : #visiting }
PCGGenericVisitor >> visitSequenceNode: aSequenceNode [
	^ self visitProgramNode: aSequenceNode
]

{ #category : #visiting }
PCGGenericVisitor >> visitSuperNode: aSuperNode [
	^ self visitProgramNode: aSuperNode
]

{ #category : #visiting }
PCGGenericVisitor >> visitTemplateParameter: aTemplateParameter [
	^ self visitProgramNode: aTemplateParameter
]

{ #category : #visiting }
PCGGenericVisitor >> visitTemporaryNode: aTemporaryNode [
	^ self visitProgramNode: aTemporaryNode
]

{ #category : #visiting }
PCGGenericVisitor >> visitThisContextNode: aThisContextNode [
	^ self visitProgramNode: aThisContextNode
]
