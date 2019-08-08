Extension { #name : #KMMetaModifier }

{ #category : #'*PharoCodeGenerator' }
KMMetaModifier >> asPCG [
	^ KMModifier asPCG receiveMessage: #meta
]
