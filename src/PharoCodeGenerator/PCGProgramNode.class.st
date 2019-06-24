"
I model RBProgramNode node for generating Pharo code.
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
	^ self subclassResponsibility
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

{ #category : #accessing }
PCGProgramNode >> realAST [
	^ PCGReflexiveConverterToRealAST new
		visit: self
]

{ #category : #accessing }
PCGProgramNode >> sourceCode [
	^ self realAST newSource
]
