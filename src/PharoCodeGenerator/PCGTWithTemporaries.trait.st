Trait {
	#name : #PCGTWithTemporaries,
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #adding }
PCGTWithTemporaries >> addTemporary: aTemporaryNode [
	self temporaries add: aTemporaryNode  asPCG
]

{ #category : #accessing }
PCGTWithTemporaries >> temporaries [
	^ self explicitRequirement
]
