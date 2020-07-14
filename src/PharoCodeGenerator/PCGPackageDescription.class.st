Class {
	#name : #PCGPackageDescription,
	#superclass : #PCGAbstractBehaviorsContainer,
	#instVars : [
		'tags',
		'extensionMethods'
	],
	#category : #'PharoCodeGenerator-MetaModel'
}

{ #category : #accessing }
PCGPackageDescription >> extensionMethods [
	^ extensionMethods
]

{ #category : #accessing }
PCGPackageDescription >> extensionMethods: anObject [
	extensionMethods := anObject
]

{ #category : #initialization }
PCGPackageDescription >> initialize [
	super initialize.
	self tags: OrderedCollection new.
	self extensionMethods: OrderedCollection new
]

{ #category : #installing }
PCGPackageDescription >> installOn: anImage [
	^ anImage installPCGPackageDescription: self
]

{ #category : #installing }
PCGPackageDescription >> installPCGMethod: aPCGMethod [
	self extensionMethods
		add: aPCGMethod
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
