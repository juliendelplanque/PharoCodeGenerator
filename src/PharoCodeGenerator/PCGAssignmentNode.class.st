"
I model RBAssignmentNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGAssignmentNode,
	#superclass : #PCGValueNode,
	#instVars : [
		'#variable type: PCGVariableNode',
		'#value type: PCGTAssignable'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGAssignmentNode class >> instanceVariablesForRealAST [
	^ #(#variable #value)
]

{ #category : #'instance creation' }
PCGAssignmentNode class >> variable: variable value: value [ 
	^ self new
		variable: variable;
		value: value;
		yourself
]

{ #category : #comparing }
PCGAssignmentNode >> = anObject [
	<generated>
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ variable = anObject variable and: [ value = anObject value ]
]

{ #category : #visiting }
PCGAssignmentNode >> acceptVisitor: aVisitor [
	^ aVisitor visitAssignmentNode: self
]

{ #category : #comparing }
PCGAssignmentNode >> hash [
	<generated>
	^ variable hash bitXor: value hash
]

{ #category : #testing }
PCGAssignmentNode >> isAssignment [
	<generated>
	^ true
]

{ #category : #accessing }
PCGAssignmentNode >> value [
	^ value
]

{ #category : #accessing }
PCGAssignmentNode >> value: anObject [
	value := anObject
]

{ #category : #accessing }
PCGAssignmentNode >> variable [
	^ variable
]

{ #category : #accessing }
PCGAssignmentNode >> variable: anObject [
	variable := anObject
]
