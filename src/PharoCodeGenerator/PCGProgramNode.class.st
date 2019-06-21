"
I model {1} node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGProgramNode,
	#superclass : #Object,
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGProgramNode class >> classForRealAST [
	^ RBProgramNode
]

{ #category : #accessing }
PCGProgramNode class >> instanceVariablesForRealAST [
	^ #()
]

{ #category : #factory }
PCGProgramNode class >> self [
	^ PCGSelfNode new
]

{ #category : #factory }
PCGProgramNode class >> super [
	^ PCGSuperNode new
]

{ #category : #factory }
PCGProgramNode class >> thisContext [
	^ PCGThisContextNode new
]

{ #category : #visiting }
PCGProgramNode >> acceptVisitor: aConverterToRealAST [
	^ aConverterToRealAST visitProgramNode: self
]

{ #category : #converting }
PCGProgramNode >> asPCG [
	^ self
]

{ #category : #accessing }
PCGProgramNode >> classForRealAST [
	^ self class classForRealAST
]

{ #category : #accessing }
PCGProgramNode >> instanceVariablesForRealAST [
	^ self class instanceVariablesForRealAST
]
