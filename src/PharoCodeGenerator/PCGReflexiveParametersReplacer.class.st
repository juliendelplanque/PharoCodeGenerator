"
I substitute PCGTemplateParameterNodes with objects for which its key is equal to the template parameter name in my #context.
"
Class {
	#name : #PCGReflexiveParametersReplacer,
	#superclass : #PCGGenericVisitor,
	#instVars : [
		'context'
	],
	#category : #'PharoCodeGenerator-Visitors'
}

{ #category : #accessing }
PCGReflexiveParametersReplacer >> context [
	^ context
]

{ #category : #accessing }
PCGReflexiveParametersReplacer >> context: anObject [
	context := anObject
]

{ #category : #visiting }
PCGReflexiveParametersReplacer >> visitProgramNode: aProgramNode [
	|copiedNode|
	copiedNode := aProgramNode class new.
	aProgramNode class allInstVarNames do: [ :instVarName |
		|subNode realSubNode|
		subNode := instVarName value: aProgramNode.
		realSubNode := (subNode isKindOf: PCGProgramNode)
			ifTrue: [ self visit: subNode ]
			ifFalse: [ 
				(subNode isCollection and: [ subNode isString not ])
					ifTrue: [ subNode collect: [ :subsubNode | self visit: subsubNode ] ]
					ifFalse: [ subNode ] ].
		((PCGTUnchangeableName users includesAny: aProgramNode class withAllSuperclasses) and: [ instVarName = #name ])
			ifFalse: [ 
				copiedNode
					perform: instVarName asMutator
					with: realSubNode ] ].
	^ copiedNode
]

{ #category : #visiting }
PCGReflexiveParametersReplacer >> visitTemplateParameter: aTemplateParameter [
	^ (self context
		at: aTemplateParameter name
		ifAbsent: [ 
			self error: 'Template parameter not found in the context: #' , aTemplateParameter name ]) veryDeepCopy
]
