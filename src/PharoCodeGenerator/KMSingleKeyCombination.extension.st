Extension { #name : #KMSingleKeyCombination }

{ #category : #'*PharoCodeGenerator' }
KMSingleKeyCombination >> asPCG [
	^ self key asPCG receiveMessage: #asKeyCombination
]
