Class {
	#name : #PCGMetaMetaCodeGenerator,
	#superclass : #PCGVisitor,
	#category : #'PharoCodeGenerator-Visitors'
}

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> buildReceiveMessageCall: aMessageNode for: visitedReceiver [
	aMessageNode arguments
		ifEmpty: [ ^ visitedReceiver
				receiveMessage: #receiveMessage:
				with: aMessageNode selector asPCG ].
	aMessageNode arguments size = 1
		ifTrue: [ ^ visitedReceiver
				receiveMessage: #receiveMessage:with:
				with: aMessageNode selector asPCG
				with: (self visit: aMessageNode arguments first) ].
	aMessageNode arguments size = 2
		ifTrue: [ ^ visitedReceiver
				receiveMessage: #receiveMessage:with:with:
				with: aMessageNode selector asPCG
				with: (self visit: aMessageNode arguments first)
				with: (self visit: aMessageNode arguments second) ].
	aMessageNode arguments size = 3
		ifTrue: [ ^ visitedReceiver
				receiveMessage: #receiveMessage:with:with:with:
				withAll:
					{aMessageNode selector asPCG}
						, (aMessageNode arguments collect: [ :arg | self visit: arg ]) ].
	^ visitedReceiver
		receiveMessage: #receiveMessage:withAll:
		with: aMessageNode selector asPCG
		with: (aMessageNode arguments collect: [ :arg | self visit: arg ]) asArray asPCG
]

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> visitArgumentNode: anArgumentNode [
	^ anArgumentNode name asPCG receiveMessage: #asPCGArgument
]

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> visitArrayNode: anArrayNode [
	^ (anArrayNode statements collect: [ :statement | self visit: statement ]) asArray asPCG
		receiveMessage: #asPCG
]

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> visitAssignmentNode: anAssignmentNode [
	^ (self visit: anAssignmentNode variable) receiveMessage: #assign: with: (self visit: anAssignmentNode value)
]

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> visitBlockNode: aBlockNode [
	^ (PCGBlockNode asPCG receiveMessage: #arguments: with: (aBlockNode arguments collect: [ :arg | self visit: arg ]) asArray asPCG)
			receiveMessage: #bodyBlock:
			with: ((PCGBlockNode arguments: { #body asPCGArgument })
						bodyBlock: [ :body |
							aBlockNode statements do: [ :statement |
								body << (#body asPCGArgument receiveMessage: #<< with: (self visit: statement)) ] ])
]

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> visitCascadeNode: aCascadeNode [
	| cascade |
	cascade := ((self visit: aCascadeNode target) receiveMessage: #asCascadeTarget) asCascadeTarget.
	
	aCascadeNode messages do: [ :message |
		self buildReceiveMessageCall: message for: cascade ].
	
	^ cascade
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
PCGMetaMetaCodeGenerator >> visitLiteralArrayNode: aLiteralArrayNode [
	^ PCGLiteralArrayNode asPCG
		receiveMessage: #contents: 
		with: (aLiteralArrayNode contents collect: [ :statement | self visit: statement ]) asArray asPCG
]

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> visitLiteralValueNode: aLiteralValueNode [
	^ aLiteralValueNode value asPCG receiveMessage: #asPCG
]

{ #category : #visiting }
PCGMetaMetaCodeGenerator >> visitMessageNode: aMessageNode [
	| visitedReceiver |
	visitedReceiver := self visit: aMessageNode receiver.
	^ self buildReceiveMessageCall: aMessageNode for: visitedReceiver
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
PCGMetaMetaCodeGenerator >> visitSequenceNode: aSequenceNode [
	^ PCGSequenceNode asPCG
		receiveMessage: #temporaries:statements:
		with: (aSequenceNode temporaries collect: [ :temporary | self visit: temporary ]) asArray asPCG
		with: (aSequenceNode statements collect: [ :statement | self visit: statement ]) asArray asPCG
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
