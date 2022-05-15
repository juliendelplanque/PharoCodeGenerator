Class {
	#name : #PCGPharoFrom9CompatibilityRBFactory,
	#superclass : #PCGPharoCompatibilityRBFactory,
	#category : #'PharoCodeGenerator-RB-Pharo9'
}

{ #category : #accessing }
PCGPharoFrom9CompatibilityRBFactory class >> argumentNamed: aName [

	^ RBVariableNode named: aName
]

{ #category : #accessing }
PCGPharoFrom9CompatibilityRBFactory class >> globalNamed: aName [

	^ (RBVariableNode named: aName)
		  variable: GlobalVariable new;
		  yourself
]

{ #category : #accessing }
PCGPharoFrom9CompatibilityRBFactory class >> instanceVariableNamed: aName [

	^ (RBVariableNode named: aName)
		  variable: (Slot named: aName);
		  yourself
]

{ #category : #accessing }
PCGPharoFrom9CompatibilityRBFactory class >> selfNode [

	^ RBVariableNode selfNode
]

{ #category : #accessing }
PCGPharoFrom9CompatibilityRBFactory class >> superNode [

	^ RBVariableNode superNode
]

{ #category : #accessing }
PCGPharoFrom9CompatibilityRBFactory class >> temporaryVariableNamed: aName [

	^ RBVariableNode named: aName
]

{ #category : #accessing }
PCGPharoFrom9CompatibilityRBFactory class >> thisContextNode [
	^ RBVariableNode thisContextNode 
]
