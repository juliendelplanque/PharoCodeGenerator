Extension { #name : #KMAltModifier }

{ #category : #'*PharoCodeGenerator' }
KMAltModifier >> asPCG [
	^ KMModifier asPCG receiveMessage: #alt
]
