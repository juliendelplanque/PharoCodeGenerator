Extension { #name : #RBLiteralValueNode }

{ #category : #'*PharoCodeGenerator-RB' }
RBLiteralValueNode >> value: aValue [
	^ self value: aValue start: 0 stop: -1
]
