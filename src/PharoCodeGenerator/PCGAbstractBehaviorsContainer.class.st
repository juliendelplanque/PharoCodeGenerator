Class {
	#name : #PCGAbstractBehaviorsContainer,
	#superclass : #Object,
	#instVars : [
		'behaviors'
	],
	#category : #'PharoCodeGenerator-MetaModel'
}

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
