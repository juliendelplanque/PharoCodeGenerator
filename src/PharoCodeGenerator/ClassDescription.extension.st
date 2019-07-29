Extension { #name : #ClassDescription }

{ #category : #'*PharoCodeGenerator' }
ClassDescription >> asPCG [
	| ast |
	ast := self instanceSide name asPCGGlobal.
	self isClassSide
		ifTrue: [ ast := ast receiveMessage: #class ].
	^ ast
]
