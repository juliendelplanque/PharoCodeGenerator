Extension { #name : #Symbol }

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
Symbol >> asPCGNode [
	"Returns a PCG node by evaluating myself against PCGProgramNode.
	
	 #self asPCGNode >>> PCGSelfNode new
	 #super asPCGNode >>> PCGSuperNode new
	 #thisContext asPCGNode >>> PCGThisContextNode new
	"
	^ self value: PCGProgramNode
]

{ #category : #'*PharoCodeGenerator' }
Symbol >> asPCGTemplateParameter [
	^ PCGTemplateParameter name: self
]

{ #category : #'*PharoCodeGenerator' }
Symbol >> asPCGTemporary [
	^ PCGTemporaryNode name: self
]
