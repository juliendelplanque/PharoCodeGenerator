Extension { #name : #KMModifiedKeyCombination }

{ #category : #'*PharoCodeGenerator' }
KMModifiedKeyCombination >> asPCG [
	^ self modifier asPCG receiveMessage: #+ with: self character asPCG
]
