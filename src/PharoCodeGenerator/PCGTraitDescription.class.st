Class {
	#name : #PCGTraitDescription,
	#superclass : #PCGBehaviorDescription,
	#category : #'PharoCodeGenerator-MetaModel'
}

{ #category : #installing }
PCGTraitDescription >> installOn: aRPackage [
	| traitInstalled |
	traitInstalled := Trait
		named: self name evaluate
		uses: self traitCompositionUsed evaluate
		package: aRPackage name.
		
	self methods do: [ :method |
		method installOn: traitInstalled ]
]
