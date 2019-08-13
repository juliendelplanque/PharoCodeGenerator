"
A PCGTemplatesRepositoryTest is a test class for testing the behavior of PCGTemplatesRepository
"
Class {
	#name : #PCGTemplatesRepositoryTest,
	#superclass : #TestCase,
	#instVars : [
		'templateRepository'
	],
	#category : #'PharoCodeGenerator-Tests-Templates'
}

{ #category : #running }
PCGTemplatesRepositoryTest >> setUp [
	super setUp.
	templateRepository := PCGTemplatesRepository new
]

{ #category : #test }
PCGTemplatesRepositoryTest >> testEqualMethodForSlotsWithSuperCall [
	self
		should: [ templateRepository equalMethodForSlots: #(#name #surname #age) withSuperCall: false ]
		raise: Error.

	self assert: (templateRepository equalMethodForSlots: { #name => InstanceVariableSlot. #surname => InstanceVariableSlot. #age => InstanceVariableSlot} withSuperCall: false) sourceCode equals: '= anObject
	<generated>
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ (age = anObject age and: [ surname = anObject surname ])
		and: [ name = anObject name ]'.
		
	self assert: (templateRepository equalMethodForSlots: { #name => InstanceVariableSlot. #surname => InstanceVariableSlot. #age => InstanceVariableSlot} withSuperCall: true) sourceCode equals: '= anObject
	<generated>
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ ((super = anObject and: [ age = anObject age ])
		and: [ surname = anObject surname ]) and: [ name = anObject name ]'
]
