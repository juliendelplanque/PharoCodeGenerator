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
PCGProgramNode class >> instanceVariablesForRealAST [
	^ #()
]

{ #category : #visiting }
PCGProgramNode >> acceptVisitor: aVisitor [
	^ self subclassResponsibility
]

{ #category : #converting }
PCGProgramNode >> asPCG [
	^ self
]

{ #category : #checking }
PCGProgramNode >> checkAST [
	PCGASTChecker new
		visit: self
]

{ #category : #accessing }
PCGProgramNode >> classForRealAST [
	^ self class classForRealAST
]

{ #category : #accessing }
PCGProgramNode >> instanceVariablesForRealAST [
	^ self class instanceVariablesForRealAST
]

{ #category : #converting }
PCGProgramNode >> meta [
	self checkAST.
	^ PCGMetaMetaCodeGenerator new
		visit: self
]

{ #category : #converting }
PCGProgramNode >> sourceCode [
	^ self realAST newSource
]

{ #category : #'parameters-substitution' }
PCGProgramNode >> substituteParametersWith: anObject [
	^ PCGStaticParametersReplacer new
		context: anObject asDictionary;
		visit: self
]
