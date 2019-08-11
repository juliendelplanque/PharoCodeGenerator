"
I model RBArrayNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGArrayNode,
	#superclass : #PCGValueNode,
	#traits : 'PCGTMessageReceiver',
	#classTraits : 'PCGTMessageReceiver classTrait',
	#instVars : [
		'#statements type: (SequenceableCollection withItemsType: PCGTStatement)'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGArrayNode class >> instanceVariablesForRealAST [
	^ #(#statements)
]

{ #category : #'instance creation' }
PCGArrayNode class >> statements: statements [ 
	^ self new
		statements: statements;
		yourself
]

{ #category : #visiting }
PCGArrayNode >> acceptVisitor: aVisitor [
	^ aVisitor visitArrayNode: self
]

{ #category : #accessing }
PCGArrayNode >> statements [
	^ statements
]

{ #category : #accessing }
PCGArrayNode >> statements: anObject [
	statements := anObject asOrderedCollection
]
