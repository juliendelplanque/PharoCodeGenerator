Trait {
	#name : #PCGTInstallableEntity,
	#instVars : [
		'installationHooks'
	],
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #adding }
PCGTInstallableEntity >> addInstallationHook: aBlock [
	self installationHooks add: aBlock
]

{ #category : #accessing }
PCGTInstallableEntity >> installationHooks [
	^ installationHooks ifNil: [ installationHooks := OrderedCollection new ]
]

{ #category : #accessing }
PCGTInstallableEntity >> installationHooks: anObject [
	installationHooks := anObject
]

{ #category : #'installation hooks' }
PCGTInstallableEntity >> runInstallationHooksFor: anObject [
	self installationHooks do: [ :block |
		block cull: anObject ]
]
