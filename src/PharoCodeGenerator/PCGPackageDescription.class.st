Class {
	#name : #PCGPackageDescription,
	#superclass : #PCGAbstractBehaviorsContainer,
	#instVars : [
		'tags'
	],
	#category : #'PharoCodeGenerator-MetaModel'
}

{ #category : #installing }
PCGPackageDescription >> install [
	self halt: #TODO
]

{ #category : #installing }
PCGPackageDescription >> installOn: anImage [
	^ anImage installPCGPackageDescription: self
]

{ #category : #installing }
PCGPackageDescription >> installPCGPackageTagDescription: aPCGPackageTagDescription [
	self tags add: aPCGPackageTagDescription
]

{ #category : #accessing }
PCGPackageDescription >> tags [
	^ tags
]

{ #category : #accessing }
PCGPackageDescription >> tags: anObject [
	tags := anObject
]
