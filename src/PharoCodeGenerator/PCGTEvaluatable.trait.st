Trait {
	#name : #PCGTEvaluatable,
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #compiler }
PCGTEvaluatable >> compiler [
	^ self class compiler
]

{ #category : #evaluating }
PCGTEvaluatable >> evaluate [
	^ self compiler evaluate: self sourceCode
]
