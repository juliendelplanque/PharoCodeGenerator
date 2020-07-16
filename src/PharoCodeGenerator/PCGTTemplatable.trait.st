Trait {
	#name : #PCGTTemplatable,
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #'parameters-substitution' }
PCGTTemplatable >> substituteParametersWith: anObject [
	^ PCGStaticParametersReplacer new
		context: anObject asDictionary;
		visit: self
]
