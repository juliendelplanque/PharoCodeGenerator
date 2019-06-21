"
I model RBVariableNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGVariableNode,
	#superclass : #PCGValueNode,
	#traits : 'PCGTMessageReceiver',
	#classTraits : 'PCGTMessageReceiver classTrait',
	#instVars : [
		'name'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGVariableNode class >> classForRealAST [
	^ RBVariableNode
]

{ #category : #accessing }
PCGVariableNode class >> instanceVariablesForRealAST [
	^ #(#name)
]

{ #category : #'instance creation' }
PCGVariableNode class >> name: name [ 
	^ self new
		name: name;
		yourself
]

{ #category : #visiting }
PCGVariableNode >> acceptVisitor: aConverterToRealAST [
	^ aConverterToRealAST visitVariableNode: self
]

{ #category : #accessing }
PCGVariableNode >> name [
	^ name
]

{ #category : #accessing }
PCGVariableNode >> name: anObject [
	name := anObject
]
