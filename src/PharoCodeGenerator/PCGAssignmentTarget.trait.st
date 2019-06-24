Trait {
	#name : #PCGAssignmentTarget,
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #dsl }
PCGAssignmentTarget >> assign: anObject [
	^ anObject asPCG assignTo: self
]
