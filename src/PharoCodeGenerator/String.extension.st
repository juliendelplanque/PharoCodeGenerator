Extension { #name : #String }

{ #category : #'*PharoCodeGenerator' }
String >> asPCG [
	^ PCGLiteralValueNode value: self
]
