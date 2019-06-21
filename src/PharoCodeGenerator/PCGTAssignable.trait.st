Trait {
	#name : #PCGTAssignable,
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #dsl }
PCGTAssignable >> assignTo: aNode [
	^ PCGAssignmentNode variable: aNode asPCG value: self
]
