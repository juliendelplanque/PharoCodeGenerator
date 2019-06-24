Trait {
	#name : #PCGFakeTrait,
	#category : #'PharoCodeGenerator-Tests-FakeClasses'
}

{ #category : #'as yet unclassified' }
PCGFakeTrait classSide >> test [
	| foo |
	foo := 1 + 1.
	^ 42
]
