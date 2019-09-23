Class {
	#name : #PCGCompositeTemplateParameter,
	#superclass : #PCGProgramNode,
	#traits : 'PCGTReturnable + PCGTAssignable + PCGTCascadeTarget + PCGTStatement + PCGTMessageReceiver + PCGTAssignmentTarget',
	#classTraits : 'PCGTReturnable classTrait + PCGTAssignable classTrait + PCGTCascadeTarget classTrait + PCGTStatement classTrait + PCGTMessageReceiver classTrait + PCGTAssignmentTarget classTrait',
	#instVars : [
		'#templateParameters type: (SequenceableCollection withItemsType: PCGTemplateParameter)',
		'#transformationBlock interface: #(#valueWithArguments: )'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #dsl }
PCGCompositeTemplateParameter >> , aTemplateParameter [
	self addParameter: aTemplateParameter
]

{ #category : #comparing }
PCGCompositeTemplateParameter >> = anObject [
	<generated>
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ templateParameters = anObject templateParameters
		and: [ transformationBlock = anObject transformationBlock ]
]

{ #category : #dsl }
PCGCompositeTemplateParameter >> => aBlock [
	self transformationBlock: aBlock
]

{ #category : #visiting }
PCGCompositeTemplateParameter >> acceptVisitor: aPCGVisitor [
	<generated>
	^ aPCGVisitor visitCompositeTemplateParameter: self
]

{ #category : #adding }
PCGCompositeTemplateParameter >> addParameter: aTemplateParameter [
	self templateParameters add: aTemplateParameter
]

{ #category : #converting }
PCGCompositeTemplateParameter >> asPCGTemplateParameter [
	^ self
]

{ #category : #comparing }
PCGCompositeTemplateParameter >> hash [
	<generated>
	^ templateParameters hash bitXor: transformationBlock hash
]

{ #category : #initialization }
PCGCompositeTemplateParameter >> initialize [
	super initialize.
	self templateParameters: OrderedCollection new
]

{ #category : #accessing }
PCGCompositeTemplateParameter >> templateParameters [
	^ templateParameters
]

{ #category : #accessing }
PCGCompositeTemplateParameter >> templateParameters: anObject [
	templateParameters := anObject
]

{ #category : #accessing }
PCGCompositeTemplateParameter >> transform: anArrayOfObjects [
	^ self transformationBlock valueWithArguments: anArrayOfObjects
]

{ #category : #accessing }
PCGCompositeTemplateParameter >> transformationBlock [
	^ transformationBlock
]

{ #category : #accessing }
PCGCompositeTemplateParameter >> transformationBlock: anObject [
	transformationBlock := anObject
]
