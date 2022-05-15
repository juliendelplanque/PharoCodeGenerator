Class {
	#name : #PCGPharoUpTo8CompatibilityRBFactory,
	#superclass : #PCGPharoCompatibilityRBFactory,
	#category : #'PharoCodeGenerator-RB-PharoUpTo8'
}

{ #category : #accessing }
PCGPharoUpTo8CompatibilityRBFactory class >> argumentNamed: aName [
	^ RBArgumentNode named: aName
]

{ #category : #accessing }
PCGPharoUpTo8CompatibilityRBFactory class >> globalNamed: aName [
	^ RBGlobalNode named: aName
]

{ #category : #accessing }
PCGPharoUpTo8CompatibilityRBFactory class >> instanceVariableNamed: aName [
	^ RBInstanceVariableNode named: aName
]

{ #category : #accessing }
PCGPharoUpTo8CompatibilityRBFactory class >> selfNode [
	^ RBSelfNode named: 'self'
]

{ #category : #accessing }
PCGPharoUpTo8CompatibilityRBFactory class >> superNode [
	^ RBSuperNode named: 'super'
]

{ #category : #accessing }
PCGPharoUpTo8CompatibilityRBFactory class >> temporaryVariableNamed: aName [
	^ RBTemporaryNode named: aName
]

{ #category : #accessing }
PCGPharoUpTo8CompatibilityRBFactory class >> thisContextNode [
	^ RBThisContextNode named: 'thisContext'
]
