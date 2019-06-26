Extension { #name : #Boolean }

{ #category : #'*PharoCodeGenerator' }
Boolean >> asPCG [
	^ PCGLiteralValueNode value: self
]
