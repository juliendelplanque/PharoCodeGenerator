Extension { #name : #KMShiftModifier }

{ #category : #'*PharoCodeGenerator' }
KMShiftModifier >> asPCG [
	^ KMModifier asPCG receiveMessage: #shift
]
