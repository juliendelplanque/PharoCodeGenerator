Class {
	#name : #PCGSmalltalkImage,
	#superclass : #Object,
	#traits : 'PCGTInstallableEntity',
	#classTraits : 'PCGTInstallableEntity classTrait',
	#instVars : [
		'packages'
	],
	#category : #'PharoCodeGenerator-MetaModel'
}

{ #category : #initialization }
PCGSmalltalkImage >> initialize [
	super initialize.
	self packages: OrderedCollection new
]

{ #category : #installing }
PCGSmalltalkImage >> installPCGPackageDescription: aPCGPackageDescription [
	self packages add: aPCGPackageDescription
]

{ #category : #accessing }
PCGSmalltalkImage >> packages [
	^ packages
]

{ #category : #accessing }
PCGSmalltalkImage >> packages: anObject [
	packages := anObject
]
