Extension { #name : #Number }

{ #category : #'*PharoCodeGenerator' }
Number >> asPCG [
	^ PCGLiteralValueNode value: self
]
