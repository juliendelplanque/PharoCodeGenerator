Class {
	#name : #PCGAbstractBehaviorsContainer,
	#superclass : #Object,
	#traits : 'PCGTInstallableEntity',
	#classTraits : 'PCGTInstallableEntity classTrait',
	#instVars : [
		'behaviors',
		'name'
	],
	#category : #'PharoCodeGenerator-MetaModel'
}

{ #category : #'instance creation' }
PCGAbstractBehaviorsContainer class >> named: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #accessing }
PCGAbstractBehaviorsContainer >> behaviors [
	^ behaviors
]

{ #category : #accessing }
PCGAbstractBehaviorsContainer >> behaviors: anObject [
	behaviors := anObject
]

{ #category : #initialization }
PCGAbstractBehaviorsContainer >> initialize [
	super initialize.
	self behaviors: OrderedCollection new
]

{ #category : #installing }
PCGAbstractBehaviorsContainer >> installPCGClass: aPCGClassDescription [
	self behaviors
		add: aPCGClassDescription
]

{ #category : #installing }
PCGAbstractBehaviorsContainer >> installPCGTrait: aPCGTraitDescription [
	self behaviors
		add: aPCGTraitDescription
]

{ #category : #accessing }
PCGAbstractBehaviorsContainer >> name [
	^ name
]

{ #category : #accessing }
PCGAbstractBehaviorsContainer >> name: anObject [
	name := anObject asPCG
]

{ #category : #printing }
PCGAbstractBehaviorsContainer >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	aStream nextPutAll: ([ self name evaluate ] on: Error do: [ 'Can not generate name.' ]).
	aStream nextPut: $)
]
