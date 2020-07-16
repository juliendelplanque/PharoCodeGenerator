Extension { #name : #RPackage }

{ #category : #'*PharoCodeGenerator' }
RPackage >> installPCGClass: aPCGClassDescription [
	| classInstalled |
	classInstalled := aPCGClassDescription superclass
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
	self halt: #TODO
]

{ #category : #'*PharoCodeGenerator' }
RPackage >> installPCGTrait: aPCGTraitDescription [
	| traitInstalled |
	traitInstalled := Trait
		named: aPCGTraitDescription name evaluate
		uses: aPCGTraitDescription traitCompositionUsed evaluate
		package: self name.
		
	aPCGTraitDescription methods do: [ :method |
		method installOn: traitInstalled ].

	^ traitInstalled.
]
