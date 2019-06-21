Trait {
	#name : #PCGTStatementsStream,
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #dsl }
PCGTStatementsStream >> << anASTNode [
	^ self addStatement: anASTNode
]

{ #category : #dsl }
PCGTStatementsStream >> addStatement: anASTNode [
	self statements
		add: anASTNode asPCG
]

{ #category : #accessing }
PCGTStatementsStream >> statements [
	^ self explicitRequirement
]
