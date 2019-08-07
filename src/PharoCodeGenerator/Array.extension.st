Extension { #name : #Array }

{ #category : #'*PharoCodeGenerator' }
Array >> asPCG [
	^ PCGArrayNode statements: (self collect: #asPCG)
]
