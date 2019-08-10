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
		do: [
			spec
				baseline: 'TypedSlot'
				with: [ spec repository: 'github://juliendelplanque/TypedSlot:v1.2.0/src'].
			"Packages"
			spec
				package: 'PharoCodeGenerator' with: [ spec requires: #('TypedSlot') ];
				package: 'PharoCodeGenerator-RB' with: [ spec requires: #('PharoCodeGenerator') ];
				package: 'PharoCodeGenerator-Tests' with: [ spec requires: #('PharoCodeGenerator') ] ]
]
