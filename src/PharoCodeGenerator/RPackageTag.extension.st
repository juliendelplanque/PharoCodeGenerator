Extension { #name : #RPackageTag }

{ #category : #'*PharoCodeGenerator' }
RPackageTag >> installPCGClass: aPCGClassDescription [
	| classInstalled |
	classInstalled := aPCGClassDescription superclassName evaluate
		subclass: aPCGClassDescription name evaluate
		uses: aPCGClassDescription traitCompositionUsed evaluate
		slots: aPCGClassDescription slotsDeclaration evaluate
		classVariables: aPCGClassDescription classVariables
		category: self categoryName.
	aPCGClassDescription methods do: [ :method | 
		method installOn: classInstalled ].
	
	aPCGClassDescription runInstallationHooksFor: classInstalled.
	
	^ classInstalled
]

{ #category : #'*PharoCodeGenerator' }
RPackageTag >> installPCGTrait: aPCGTraitDescription [
	| traitInstalled |
	traitInstalled := Trait
		named: aPCGTraitDescription name evaluate
		uses: aPCGTraitDescription traitCompositionUsed evaluate
		slots: aPCGTraitDescription slotsDeclaration evaluate
		category: self categoryName.
		
	aPCGTraitDescription methods do: [ :method |
		method installOn: traitInstalled ].
	
	aPCGTraitDescription runInstallationHooksFor: traitInstalled.

	^ traitInstalled.
]
