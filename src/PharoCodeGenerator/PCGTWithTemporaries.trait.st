"
I provide the DSL for nodes that wrap a body and need to get temporary variable declaration.
"
Trait {
	#name : #PCGTWithTemporaries,
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #dsl }
PCGTWithTemporaries >> addTemporary: aTemporaryNode [
	self temporaries add: aTemporaryNode asPCG
]

{ #category : #accessing }
PCGTWithTemporaries >> temporaries [
	^ self explicitRequirement
]
