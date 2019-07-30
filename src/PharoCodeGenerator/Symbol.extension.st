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
	
	self = #self
		ifTrue: [ PCGSelfNode new ].
		
	self = #super
		ifTrue: [ PCGSuperNode new ].
		
	self = #thisContext
		ifTrue: [ PCGThisContextNode new ].
		
	self error: 'Symbol can not be converted as PCG node.'
]

{ #category : #'*PharoCodeGenerator' }
Symbol >> asPCGTemplateParameter [
	^ PCGTemplateParameter name: self
]

{ #category : #'*PharoCodeGenerator' }
Symbol >> asPCGTemporary [
	^ PCGTemporaryNode name: self
]
