Class {
	#name : #PCGAbstractBehaviorsContainer,
	#superclass : #Object,
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
