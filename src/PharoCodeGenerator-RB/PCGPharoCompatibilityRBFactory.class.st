Class {
	#name : #PCGPharoCompatibilityRBFactory,
	#superclass : #Object,
	#category : #'PharoCodeGenerator-RB'
}

{ #category : #accessing }
PCGPharoCompatibilityRBFactory class >> argumentNamed: aName [
	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
PCGPharoCompatibilityRBFactory class >> availableFactory [
	self assert: self subclasses size = 1.
	^ self subclasses anyOne
]

{ #category : #accessing }
PCGPharoCompatibilityRBFactory class >> globalNamed: aName [
	^ self subclassResponsibility 
]

{ #category : #accessing }
PCGPharoCompatibilityRBFactory class >> instanceVariableNamed: aName [
	^ self subclassResponsibility 
]

{ #category : #testing }
PCGPharoCompatibilityRBFactory class >> isAbstract [
	^ self = PCGPharoCompatibilityRBFactory
]

{ #category : #accessing }
PCGPharoCompatibilityRBFactory class >> selfNode [
	^ self subclassResponsibility 
]

{ #category : #accessing }
PCGPharoCompatibilityRBFactory class >> superNode [
	^ self subclassResponsibility 
]

{ #category : #accessing }
PCGPharoCompatibilityRBFactory class >> temporaryVariableNamed: aName [
	^ self subclassResponsibility 
]

{ #category : #accessing }
PCGPharoCompatibilityRBFactory class >> thisContextNode [
	^ self subclassResponsibility 
]
