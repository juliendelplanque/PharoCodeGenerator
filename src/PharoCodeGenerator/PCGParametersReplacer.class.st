Class {
	#name : #PCGParametersReplacer,
	#superclass : #PCGGenericVisitor,
	#instVars : [
		'context'
	],
	#category : #'PharoCodeGenerator-Visitors'
}

{ #category : #accessing }
PCGParametersReplacer >> context [
	^ context
]

{ #category : #accessing }
PCGParametersReplacer >> context: anObject [
	context := anObject
]

{ #category : #visiting }
PCGParametersReplacer >> visitProgramNode: aProgramNode [
	|copiedNode|
	copiedNode := aProgramNode class new.
	aProgramNode class instVarNames do: [ :instVarName |
		|subNode realSubNode|
		subNode := instVarName value: aProgramNode.
		realSubNode := (subNode isKindOf: PCGProgramNode)
			ifTrue: [ self visit: subNode ]
			ifFalse: [ 
				(subNode isCollection and: [ subNode isString not ])
					ifTrue: [ subNode collect: [ :subsubNode | self visit: subsubNode ] ]
					ifFalse: [ subNode ] ].
		copiedNode
			perform: instVarName asMutator
			with: realSubNode ].
	^ copiedNode
]

{ #category : #visiting }
PCGParametersReplacer >> visitTemplateParameter: aTemplateParameter [
	^ (self context
		at: aTemplateParameter name
		ifAbsent: [ 
			self error: 'Template parameter not found in the context: #' , aTemplateParameter name ]) veryDeepCopy
]
