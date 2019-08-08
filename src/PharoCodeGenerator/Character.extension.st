Extension { #name : #Character }

{ #category : #'*PharoCodeGenerator' }
Character >> asPCG [
	^ PCGLiteralValueNode value: self
]
