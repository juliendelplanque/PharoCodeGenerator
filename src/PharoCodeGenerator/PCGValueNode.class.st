"
I model RBValueNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGValueNode,
	#superclass : #PCGProgramNode,
	#traits : 'PCGTReturnable + PCGTAssignable + PCGTCascadeTarget',
	#classTraits : 'PCGTReturnable classTrait + PCGTAssignable classTrait + PCGTCascadeTarget classTrait',
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGValueNode class >> classForRealAST [
	^ RBValueNode
]

{ #category : #accessing }
PCGValueNode class >> instanceVariablesForRealAST [
	^ #()
]
