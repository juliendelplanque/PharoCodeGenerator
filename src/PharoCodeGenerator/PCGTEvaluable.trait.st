"
I provide the API to evaluate the code represented by an AST node.
"
Trait {
	#name : #PCGTEvaluable,
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #compiler }
PCGTEvaluable >> compiler [
	^ self class compiler
]

{ #category : #evaluating }
PCGTEvaluable >> evaluate [
	^ self compiler evaluate: self sourceCode
]
