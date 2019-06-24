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
			"Packages"
			spec
				package: 'PharoCodeGenerator';
				package: 'PharoCodeGenerator-Tests' with: [ spec requires: #('PharoCodeGenerator') ] ]
]
