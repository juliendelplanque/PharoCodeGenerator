Extension { #name : #UndefinedObject }

{ #category : #'*PharoCodeGenerator' }
UndefinedObject >> asPCG [
	^ PCGLiteralValueNode value: self
]
