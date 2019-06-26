Extension { #name : #Symbol }

{ #category : #'*PharoCodeGenerator' }
Symbol >> asPCG [
	^ self value: PCGProgramNode
]

{ #category : #'*PharoCodeGenerator' }
Symbol >> asPCGArgument [
	^ PCGArgumentNode name: self
]

{ #category : #'*PharoCodeGenerator' }
Symbol >> asPCGGlobal [
	^ PCGGlobalNode name: self
]

{ #category : #'*PharoCodeGenerator' }
Symbol >> asPCGInstanceVariable [
	^ PCGInstanceVariableNode name: self
]

{ #category : #'*PharoCodeGenerator' }
Symbol >> asPCGTemplateParameter [
	^ PCGTemplateParameter name: self
]

{ #category : #'*PharoCodeGenerator' }
Symbol >> asPCGTemporary [
	^ PCGTemporaryNode name: self
]
