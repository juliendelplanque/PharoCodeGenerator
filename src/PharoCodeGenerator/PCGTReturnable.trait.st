"
I provide the DSL for nodes that can be returned by a method.
"
Trait {
	#name : #PCGTReturnable,
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #dsl }
PCGTReturnable >> returnIt [
	^ PCGReturnNode value: self
]
