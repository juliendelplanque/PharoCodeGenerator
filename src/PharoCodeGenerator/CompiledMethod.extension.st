Extension { #name : #CompiledMethod }

{ #category : #'*PharoCodeGenerator' }
CompiledMethod >> asPCG [
	^ self methodClass asPCG
		receiveMessage: #>> with: self selector asPCG
]
