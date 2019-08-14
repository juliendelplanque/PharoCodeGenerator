Class {
	#name : #PCGEpiceaPreviewer,
	#superclass : #Object,
	#category : #'PharoCodeGenerator-Epicea'
}

{ #category : #'as yet unclassified' }
PCGEpiceaPreviewer >> createLogFor: aBlock [
	| events |
	events := OrderedCollection new.
	aBlock on: PCGAboutToBeInstalled do: [ :aboutToBeInstalled |
		events addAll: aboutToBeInstalled asEpMethodAddition previewedApplyEvents.
		aboutToBeInstalled resignalAs: PCGShouldNotBeInstalled ].
	^ EpLog newWithEvents: events
]
