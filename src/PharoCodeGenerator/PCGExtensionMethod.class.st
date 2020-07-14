Class {
	#name : #PCGExtensionMethod,
	#superclass : #PCGMethodNode,
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
