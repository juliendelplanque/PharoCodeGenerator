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
				package: 'PharoCodeGenerator-Tests' with: [ spec requires: #('PharoCodeGenerator') ];
				package: 'PharoCodeGenerator-Meta' with: [ spec requires: #('PharoCodeGenerator' 'PharoCodeGenerator-RB' 'Iterators') ] ].

	spec
		for: #(#'pharo5.x' #'pharo6.x' #'pharo7.x' #'pharo8.x')
		do: [ spec
				package: 'PharoCodeGenerator-RB-PharoUpTo8';
				package: 'PharoCodeGenerator-RB' with: [ spec requires: #('PharoCodeGenerator-RB-PharoUpTo8') ] ]
]
