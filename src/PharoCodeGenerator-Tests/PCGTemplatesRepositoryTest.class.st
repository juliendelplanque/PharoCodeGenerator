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
		should: [ templateRepository equalMethodForSlots: #() withSuperCall: false ]
		raise: Error.
		
	self assert: (templateRepository equalMethodForSlots: { #name => InstanceVariableSlot }) sourceCode equals: '= anObject
	<generated>
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ name = anObject name'.

	self assert: (templateRepository equalMethodForSlots: { #name => InstanceVariableSlot. #surname => InstanceVariableSlot. #age => InstanceVariableSlot} withSuperCall: false) sourceCode equals: '= anObject
	<generated>
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ (name = anObject name and: [ surname = anObject surname ])
		and: [ age = anObject age ]'.
		
	self assert: (templateRepository equalMethodForSlots: { #name => InstanceVariableSlot. #surname => InstanceVariableSlot. #age => InstanceVariableSlot} withSuperCall: true) sourceCode equals: '= anObject
	<generated>
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ ((super = anObject and: [ name = anObject name ])
		and: [ surname = anObject surname ]) and: [ age = anObject age ]'
]

{ #category : #test }
PCGTemplatesRepositoryTest >> testHashMethodForSlotsWithSuperCall [
	self
		should: [ templateRepository hashMethodForSlots: #() withSuperCall: false ]
		raise: Error.
		
	self assert: (templateRepository hashMethodForSlots: { #name => InstanceVariableSlot } withSuperCall: false) sourceCode equals: 'hash
	<generated>
	^ name hash'.

	self assert: (templateRepository hashMethodForSlots: { #name => InstanceVariableSlot. #surname => InstanceVariableSlot. #age => InstanceVariableSlot} withSuperCall: false) sourceCode equals: 'hash
	<generated>
	^ (name hash bitXor: surname hash) bitXor: age hash'.
		
	self assert: (templateRepository hashMethodForSlots: { #name => InstanceVariableSlot. #surname => InstanceVariableSlot. #age => InstanceVariableSlot} withSuperCall: true) sourceCode equals: 'hash
	<generated>
	^ ((super hash bitXor: name hash) bitXor: surname hash)
		bitXor: age hash'
]
