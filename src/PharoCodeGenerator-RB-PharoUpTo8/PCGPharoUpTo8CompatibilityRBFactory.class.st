Class {
	#name : #PCGPharoUpTo8CompatibilityRBFactory,
	#superclass : #PCGPharoCompatibilityRBFactory,
	#category : #'PharoCodeGenerator-RB-PharoUpTo8'
}

{ #category : #accessing }
PCGPharoUpTo8CompatibilityRBFactory class >> argumentNamed: aName [
	^ RBArgumentNode named: name
]

{ #category : #accessing }
PCGPharoUpTo8CompatibilityRBFactory class >> globalNamed: aName [
	^ RBGlobalNode named: name
]

{ #category : #accessing }
PCGPharoUpTo8CompatibilityRBFactory class >> instanceVariableNamed: aName [
	^ RBInstanceVariableNode named: name
]

{ #category : #accessing }
PCGPharoUpTo8CompatibilityRBFactory class >> selfNode [
	^ RBSelfNode new
]

{ #category : #accessing }
PCGPharoUpTo8CompatibilityRBFactory class >> superNode [
	^ RBSuperNode new
]

{ #category : #accessing }
PCGPharoUpTo8CompatibilityRBFactory class >> temporaryVariableNamed: aName [
	^ RBTemporaryNode named: name
]

{ #category : #accessing }
PCGPharoUpTo8CompatibilityRBFactory class >> thisContextNode [
	^ RBThisContextNode new
]
