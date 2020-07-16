Extension { #name : #RPackage }

{ #category : #'*PharoCodeGenerator' }
RPackage >> installPCGClass: aPCGClassDescription [
	| classInstalled |
	classInstalled := aPCGClassDescription superclassName evaluate
		subclass: aPCGClassDescription name evaluate
		uses: aPCGClassDescription traitCompositionUsed evaluate
		slots: aPCGClassDescription slotsDeclaration evaluate
		classVariables: aPCGClassDescription classVariables
		package: self name.
	aPCGClassDescription methods do: [ :method | 
		method installOn: classInstalled ].
	
	^ classInstalled
]

{ #category : #'*PharoCodeGenerator' }
RPackage >> installPCGExtensionMethod: aPCGExtensionMethod [
	aPCGExtensionMethod methodNode
		protocol: ('*' , self name);
		installOn: aPCGExtensionMethod installationTarget evaluate
]

{ #category : #'*PharoCodeGenerator' }
RPackage >> installPCGPackageTagDescription: aPCGPackageTagDescription [
	| tag |
	(self includesClassTagNamed: aPCGPackageTagDescription name evaluate)
		ifTrue: [ self halt: #TODO "Raise notification" ].

	tag := self addClassTag: aPCGPackageTagDescription name evaluate.
	
	aPCGPackageTagDescription behaviors do: [ :b |
		b installOn: tag ]
]

{ #category : #'*PharoCodeGenerator' }
RPackage >> installPCGTrait: aPCGTraitDescription [
	| traitInstalled |
	traitInstalled := Trait
		named: aPCGTraitDescription name evaluate
		uses: aPCGTraitDescription traitCompositionUsed evaluate
		slots: aPCGTraitDescription slotsDeclaration evaluate
		category: self name.
		
	aPCGTraitDescription methods do: [ :method |
		method installOn: traitInstalled ].

	^ traitInstalled.
]
