"
I provide the DSL for get values assigned.
"
Trait {
	#name : #PCGTAssignmentTarget,
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #dsl }
PCGTAssignmentTarget >> assign: anObject [
	^ anObject asPCG assignTo: self
]
