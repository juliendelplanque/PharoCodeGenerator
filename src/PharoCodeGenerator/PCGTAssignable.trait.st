"
I provide the DSL for nodes that can be assigned to a variable.
"
Trait {
	#name : #PCGTAssignable,
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #dsl }
PCGTAssignable >> assignTo: aNode [
	^ PCGAssignmentNode variable: aNode asPCG value: self
]
