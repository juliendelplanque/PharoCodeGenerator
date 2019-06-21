Trait {
	#name : #PCGTBodyBlock,
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #dsl }
PCGTBodyBlock >> bodyBlock: aBlock [
	| sequence |
	sequence := PCGSequenceNode new.
	aBlock value: sequence.
	self body: sequence
]
