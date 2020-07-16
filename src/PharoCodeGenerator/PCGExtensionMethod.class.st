Class {
	#name : #PCGExtensionMethod,
	#superclass : #Object,
	#traits : 'PCGTInstallableEntity + PCGTTemplatable',
	#classTraits : 'PCGTInstallableEntity classTrait + PCGTTemplatable classTrait',
	#instVars : [
		'#methodNode type: PCGMethodNode',
		'#installationTarget type: PCGValueNode'
	],
	#category : #'PharoCodeGenerator-MetaModel'
}

{ #category : #'instance creation' }
PCGExtensionMethod class >> methodNode: methodNode [
	^ self new
		methodNode: methodNode;
		yourself
]

{ #category : #visiting }
PCGExtensionMethod >> acceptVisitor: aVisitor [
	^ aVisitor visitExtensionMethod: self
]

{ #category : #installing }
PCGExtensionMethod >> installOn: aPackage [
	^ aPackage installPCGExtensionMethod: self
]

{ #category : #accessing }
PCGExtensionMethod >> installationTarget [
	^ installationTarget
]

{ #category : #accessing }
PCGExtensionMethod >> installationTarget: anObject [
	installationTarget := anObject asPCG
]

{ #category : #testing }
PCGExtensionMethod >> isPCGObject [
	^ true
]

{ #category : #accessing }
PCGExtensionMethod >> methodNode [
	^ methodNode
]

{ #category : #accessing }
PCGExtensionMethod >> methodNode: anObject [
	methodNode := anObject
]
