Trait {
	#name : #PCGTReturnable,
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #dsl }
PCGTReturnable >> returnIt [
	^ PCGReturnNode value: self
]
