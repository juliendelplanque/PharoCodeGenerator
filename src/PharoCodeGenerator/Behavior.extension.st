Extension { #name : #Behavior }

{ #category : #'*PharoCodeGenerator' }
Behavior >> installPCGMethod: aPCGMethodNode [
	((self includesLocalSelector: aPCGMethodNode selector) and: [ 
		(self >> aPCGMethodNode selector) pragmas
			noneSatisfy: [ :p | p selector = aPCGMethodNode generatedPragmaSelector ] ])
				ifTrue: [ PCGHandwrittenMethodAlreadyExist signalForMethod: self >> aPCGMethodNode selector ].
				
	((self includesLocalSelector: aPCGMethodNode selector) and: [ aPCGMethodNode = (self >> aPCGMethodNode selector) asPCGAST ])
		ifTrue: [ ^ aPCGMethodNode ].
	
	[
		PCGMethodAboutToBeInstalled signalForEntity: aPCGMethodNode installTarget: self.
		self compile: aPCGMethodNode sourceCode.
		(self >> aPCGMethodNode selector)
			protocol: aPCGMethodNode protocol.
		aPCGMethodNode runInstallationHooksFor: (self >> aPCGMethodNode selector)
	] on: PCGShouldNotBeInstalled do: #return
]
