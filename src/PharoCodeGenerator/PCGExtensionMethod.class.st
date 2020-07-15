Class {
	#name : #PCGExtensionMethod,
	#superclass : #Object,
	#traits : 'PCGTInstallableEntity',
	#classTraits : 'PCGTInstallableEntity classTrait',
	#instVars : [
		'installationTarget'
	],
	#category : #'PharoCodeGenerator-MetaModel'
}

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
