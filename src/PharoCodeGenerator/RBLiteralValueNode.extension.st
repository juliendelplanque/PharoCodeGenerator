Extension { #name : #RBLiteralValueNode }

{ #category : #'*PharoCodeGenerator' }
RBLiteralValueNode >> value: aValue [
	^ self value: aValue start: 0 stop: -1
]
