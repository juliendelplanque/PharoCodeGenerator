Extension { #name : #PCGMethodAboutToBeInstalled }

{ #category : #'*PharoCodeGenerator-Epicea' }
PCGMethodAboutToBeInstalled >> asEpMethodAddition [
	^ EpMethodAddition method: self asEpiceaRingDefinition
]

{ #category : #'*PharoCodeGenerator-Epicea' }
PCGMethodAboutToBeInstalled >> asEpiceaRingDefinition [
	^ (RGMethodDefinition named: self entity selector)
		parentName: self installTarget name;
		isMetaSide: self installTarget isMeta;
		protocol: self entity protocol;
		sourceCode: self entity sourceCode;
		stamp: '';
		package: self installTarget package;
		yourself.
]
