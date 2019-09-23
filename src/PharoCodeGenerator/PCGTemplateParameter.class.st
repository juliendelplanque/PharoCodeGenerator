"
I am a parameter node for AST.

I allow one to create parametrisable AST that can get an arbitrary sub-tree to substitute myself.
"
Class {
	#name : #PCGTemplateParameter,
	#superclass : #PCGProgramNode,
	#traits : 'PCGTReturnable + PCGTAssignable + PCGTCascadeTarget + PCGTStatement + PCGTMessageReceiver + PCGTAssignmentTarget',
	#classTraits : 'PCGTReturnable classTrait + PCGTAssignable classTrait + PCGTCascadeTarget classTrait + PCGTStatement classTrait + PCGTMessageReceiver classTrait + PCGTAssignmentTarget classTrait',
	#instVars : [
		'#name type: Symbol',
		'#transformationBlock interface: #(#value: )'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #'instance creation' }
PCGTemplateParameter class >> name: name [
	^ self new
		name: name;
		yourself
]

{ #category : #comparing }
PCGTemplateParameter >> = anObject [
	<generated>
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ name = anObject name
		and: [ transformationBlock = anObject transformationBlock ]
]

{ #category : #dsl }
PCGTemplateParameter >> => aBlock [
	self transformationBlock: aBlock
]

{ #category : #visiting }
PCGTemplateParameter >> acceptVisitor: aVisitor [
	^ aVisitor visitTemplateParameter: self
]

{ #category : #converting }
PCGTemplateParameter >> asPCGTemplateParameter [
	^ self
]

{ #category : #dsl }
PCGTemplateParameter >> beArgument [
	^ self => #asPCGArgument
]

{ #category : #dsl }
PCGTemplateParameter >> beGlobal [
	^ self => #asPCGGlobal
]

{ #category : #dsl }
PCGTemplateParameter >> beInstanceVariable [
	^ self => #asPCGInstanceVariable
]

{ #category : #dsl }
PCGTemplateParameter >> beTemporary [
	^ self => #asPCGTemporary
]

{ #category : #comparing }
PCGTemplateParameter >> hash [
	<generated>
	^ name hash bitXor: transformationBlock hash
]

{ #category : #initialization }
PCGTemplateParameter >> initialize [
	super initialize.
	self transformationBlock: [ :x | x ]
]

{ #category : #accessing }
PCGTemplateParameter >> name [
	^ name
]

{ #category : #accessing }
PCGTemplateParameter >> name: anObject [
	name := anObject
]

{ #category : #transforming }
PCGTemplateParameter >> transform: anObject [
	^ self transformationBlock value: anObject
]

{ #category : #accessing }
PCGTemplateParameter >> transformationBlock [
	^ transformationBlock
]

{ #category : #accessing }
PCGTemplateParameter >> transformationBlock: aValuable [
	transformationBlock := aValuable
]
