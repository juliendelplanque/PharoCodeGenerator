"
I forbid my users to get their #name instance variable modified through the mutator.
"
Trait {
	#name : #PCGTUnchangeableName,
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #accessing }
PCGTUnchangeableName >> name: aString [
	self error: 'The name of this node can not be modified.'
]
