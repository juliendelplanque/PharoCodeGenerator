"
I model RBValueNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGValueNode,
	#superclass : #PCGProgramNode,
	#traits : 'PCGTReturnable + PCGTAssignable + PCGTCascadeTarget + PCGTStatement + PCGTEvaluable',
	#classTraits : 'PCGTReturnable classTrait + PCGTAssignable classTrait + PCGTCascadeTarget classTrait + PCGTStatement classTrait + PCGTEvaluable classTrait',
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGValueNode class >> instanceVariablesForRealAST [
	^ #()
]

{ #category : #testing }
PCGValueNode >> isValue [
	<generated>
	^ true
]
