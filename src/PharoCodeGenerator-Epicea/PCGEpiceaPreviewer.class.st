Class {
	#name : #PCGEpiceaPreviewer,
	#superclass : #Object,
	#category : #'PharoCodeGenerator-Epicea'
}

{ #category : #previewing }
PCGEpiceaPreviewer class >> previewFor: aBlock [
	^ self new previewFor: aBlock
]

{ #category : #'log-creation' }
PCGEpiceaPreviewer >> createLogFor: aBlock [
	| events |
	events := OrderedCollection new.
	aBlock on: PCGAboutToBeInstalled do: [ :aboutToBeInstalled |
		events addAll: aboutToBeInstalled asEpMethodAddition previewedApplyEvents.
		aboutToBeInstalled resignalAs: PCGShouldNotBeInstalled ].
	^ EpLog newWithEvents: events
]

{ #category : #previewing }
PCGEpiceaPreviewer >> previewFor: aBlock [
	EpLogBrowserPresenter openWithLog: (self createLogFor: aBlock)
]
