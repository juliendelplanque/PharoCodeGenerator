Class {
	#name : #BaselineOfPharoCodeGenerator,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoCodeGenerator
}

{ #category : #baselines }
BaselineOfPharoCodeGenerator >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec baseline: 'TypedSlot' with: [ spec repository: 'github://juliendelplanque/TypedSlot:v1.x.x/src' ].
			spec baseline: 'Iterators' with: [ spec repository: 'github://juliendelplanque/Iterators:v1.x.x/src' ].
			"Packages"
			spec
				package: 'PharoCodeGenerator' with: [ spec requires: #('TypedSlot') ];
				package: 'PharoCodeGenerator-RB' with: [ spec requires: #('PharoCodeGenerator') ];
				package: 'PharoCodeGenerator-Tests' with: [ spec requires: #('PharoCodeGenerator-RB') ];
				package: 'PharoCodeGenerator-Meta' with: [ spec requires: #('PharoCodeGenerator' 'PharoCodeGenerator-RB' 'Iterators') ] ].

	spec
		for: #(#'pharo5.x' #'pharo6.x' #'pharo7.x' #'pharo8.x')
		do: [ spec
				package: 'PharoCodeGenerator-RB-PharoUpTo8';
				package: 'PharoCodeGenerator-RB' with: [ spec requires: #('PharoCodeGenerator-RB-PharoUpTo8') ] ].

	spec
		for: (self pharoVersionsFrom: 9)
		do: [ spec
				package: 'PharoCodeGenerator-RB-Pharo9';
				package: 'PharoCodeGenerator-RB' with: [ spec requires: #('PharoCodeGenerator-RB-Pharo9') ] ]
]

{ #category : #baselines }
BaselineOfPharoCodeGenerator >> pharoVersionsFrom: aVersion [
	^ (aVersion to: SystemVersion current major) collect: [ :v | ('pharo' , v asString , '.x') asSymbol ]
]
