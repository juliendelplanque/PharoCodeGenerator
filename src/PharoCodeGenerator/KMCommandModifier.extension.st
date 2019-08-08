Extension { #name : #KMCommandModifier }

{ #category : #'*PharoCodeGenerator' }
KMCommandModifier >> asPCG [
	^ KMModifier asPCG receiveMessage: #command
]
