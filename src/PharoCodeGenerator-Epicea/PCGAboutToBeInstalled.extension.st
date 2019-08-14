Extension { #name : #PCGAboutToBeInstalled }

{ #category : #'*PharoCodeGenerator-Epicea' }
PCGAboutToBeInstalled >> asEpMethodAddition [
	^ EpMethodAddition method: self asEpiceaRingDefinition
]

{ #category : #'*PharoCodeGenerator-Epicea' }
PCGAboutToBeInstalled >> asEpiceaRingDefinition [
	^ (RGMethodDefinition named: self method selector)
		parentName: self installTarget name;
		isMetaSide: self installTarget isMeta;
		protocol: self method protocol;
		sourceCode: self method sourceCode;
		stamp: '';
		package: self installTarget package;
		yourself.
]
