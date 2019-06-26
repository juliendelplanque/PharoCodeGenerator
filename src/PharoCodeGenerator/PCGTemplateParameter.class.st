"
I am a parameter node for AST.

I allow one to create parametrisable AST that can get an arbitrary sub-tree to substitute myself.
"
Class {
	#name : #PCGTemplateParameter,
	#superclass : #PCGProgramNode,
	#instVars : [
		'name'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #'instance creation' }
PCGTemplateParameter class >> name: name [
	^ self new
		name: name;
		yourself
]

{ #category : #visiting }
PCGTemplateParameter >> acceptVisitor: aVisitor [
	^ aVisitor visitTemplateParameter: self
]

{ #category : #accessing }
PCGTemplateParameter >> name [
	^ name
]

{ #category : #accessing }
PCGTemplateParameter >> name: anObject [
	name := anObject
]
