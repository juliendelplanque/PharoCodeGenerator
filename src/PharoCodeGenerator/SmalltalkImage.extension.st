Extension { #name : #SmalltalkImage }

{ #category : #'*PharoCodeGenerator' }
SmalltalkImage >> installPCGPackageDescription: aPCGPackageDescription [
	| package |
	(RPackage organizer includesPackageNamed: aPCGPackageDescription name evaluate)
		ifTrue: [ self halt: #TODO "Raise notification" ].
		
	package := (RPackage named: aPCGPackageDescription name evaluate).
	package register.
	
	aPCGPackageDescription extensionMethods do: [ :m |
		m installOn: package ].
	aPCGPackageDescription tags do: [ :t |
		t installOn: package ].
	aPCGPackageDescription behaviors do: [ :b |
		b installOn: package ].
	
	aPCGPackageDescription runInstallationHooksFor: package.
	
	^ package
]
