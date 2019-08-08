Extension { #name : #KMCtrlModifier }

{ #category : #'*PharoCodeGenerator' }
KMCtrlModifier >> asPCG [
	^ KMModifier asPCG receiveMessage: #ctrl
]
