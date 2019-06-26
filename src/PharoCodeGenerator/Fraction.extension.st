Extension { #name : #Fraction }

{ #category : #'*PharoCodeGenerator' }
Fraction >> asPCG [
	^ self numerator asPCG receiveMessage: #/ with: self denominator asPCG
]
