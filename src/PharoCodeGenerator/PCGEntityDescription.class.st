Class {
	#name : #PCGEntityDescription,
	#superclass : #Object,
	#instVars : [
		'installationHooks'
	],
	#category : #'PharoCodeGenerator-MetaModel'
}

{ #category : #adding }
PCGEntityDescription >> addInstallationHook: aBlock [
	self installationHooks add: aBlock
]

{ #category : #initialization }
PCGEntityDescription >> initialize [
	super initialize.
	self installationHooks: OrderedCollection new
]

{ #category : #accessing }
PCGEntityDescription >> installationHooks [
	^ installationHooks
]

{ #category : #accessing }
PCGEntityDescription >> installationHooks: anObject [
	installationHooks := anObject
]

{ #category : #'installation hooks' }
PCGEntityDescription >> runInstallationHooksFor: anObject [
	self installationHooks do: [ :block |
		block cull: anObject ]
]
