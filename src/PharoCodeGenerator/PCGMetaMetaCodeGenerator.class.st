Class {
	#name : #PCGMetaMetaCodeGenerator,
	#superclass : #PCGVisitor,
	#category : #'PharoCodeGenerator-Visitors'
}

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> visitArgumentNode: anArgumentNode [
	^ anArgumentNode name asPCG receiveMessage: #asPCGArgument
]

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> visitAssignmentNode: anAssignmentNode [
	^ (self visit: anAssignmentNode variable) receiveMessage: #assign: with: (self visit: anAssignmentNode value)
]

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> visitGlobalNode: aGlobalNode [
	^ aGlobalNode name asPCG receiveMessage: #asPCGGlobal
]

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> visitInstanceVariableNode: aInstanceVariableNode [
	^ aInstanceVariableNode name asPCG receiveMessage: #asPCGInstanceVariable
]

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> visitLiteralValueNode: aLiteralValueNode [
	^ aLiteralValueNode value asPCG receiveMessage: #asPCG
]

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> visitPragmaNode: aPragmaNode [
	^ PCGPragmaNode asPCG
		receiveMessage: #selector:arguments: with: aPragmaNode selector asPCG with: (aPragmaNode arguments collect: [ :arg | self visit: arg ]) asArray asPCG
]

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> visitReturnNode: aReturnNode [
	^ (self visit: aReturnNode value) receiveMessage: #returnIt
]

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> visitSelfNode: aSelfNode [
	^ aSelfNode name asPCG receiveMessage: #asPCGNode
]

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> visitSuperNode: aSuperNode [
	^ aSuperNode name asPCG receiveMessage: #asPCGNode
]

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> visitTemplateParameter: aTemplateParameter [
	^ aTemplateParameter name asPCG receiveMessage: #asPCGTemplateParameter
]

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> visitTemporaryNode: aTemporaryNode [
	^ aTemporaryNode name asPCG receiveMessage: #asPCGTemporary
]

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> visitThisContextNode: aThisContextNode [
	^ aThisContextNode name asPCG receiveMessage: #asPCGNode
]
