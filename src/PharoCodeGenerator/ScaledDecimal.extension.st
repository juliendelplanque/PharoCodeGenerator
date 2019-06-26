Extension { #name : #ScaledDecimal }

{ #category : #'*PharoCodeGenerator' }
ScaledDecimal >> asPCG [
	^ PCGLiteralValueNode value: self
]
