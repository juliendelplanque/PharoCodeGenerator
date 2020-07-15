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

{ #category : #installing }
PCGTInstallableEntity >> installOn: anObject [
	^ self explicitRequirement
]

{ #category : #installing }
PCGTInstallableEntity >> installOn: aBehavior if: aBlock [
	aBlock
		ifFalse: [ ^ self ].
	
	^ self installOn: aBehavior
]

{ #category : #installing }
PCGTInstallableEntity >> installOn: aBehaviour ifHandwrittenMethodAlreadyExist: aBlock [
	[ self installOn: aBehaviour ]
		on: PCGHandwrittenMethodAlreadyExist
		do: aBlock
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
