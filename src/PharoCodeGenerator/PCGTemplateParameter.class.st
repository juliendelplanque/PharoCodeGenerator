"
I am a parameter node for AST.

I allow one to create parametrisable AST that can get an arbitrary sub-tree to substitute myself.
"
Class {
	#name : #PCGTemplateParameter,
	#superclass : #PCGProgramNode,
	#traits : 'PCGTReturnable + PCGTAssignable + PCGTCascadeTarget + PCGTStatement + PCGTMessageReceiver + PCGTAssignmentTarget',
	#classTraits : 'PCGTReturnable classTrait + PCGTAssignable classTrait + PCGTCascadeTarget classTrait + PCGTStatement classTrait + PCGTMessageReceiver classTrait + PCGTAssignmentTarget classTrait',
	#instVars : [
		'#name type: Symbol'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGTemplateParameter class >> classForRealAST [
	^ PCGNoEquivalentClassInRealAST signal
]

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
