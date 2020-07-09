"
I model RBProgramNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGProgramNode,
	#superclass : #Object,
	#instVars : [
		'#parent type: PCGProgramNode'
	],
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
PCGProgramNode >> children [
	^ (self class slots
		select: [:slot | 
			slot isTypedSlot and: [
				(slot read: self) asOrderedCollection allSatisfy: [ :o |
					o isKindOf: PCGProgramNode ] ] ]
		thenCollect: [ :slot | (slot read: self) asOrderedCollection ]) flattened
]

{ #category : #accessing }
PCGProgramNode >> classForRealAST [
	^ self class classForRealAST
]

{ #category : #accessing }
PCGProgramNode >> instanceVariablesForRealAST [
	^ self class instanceVariablesForRealAST
]

{ #category : #testing }
PCGProgramNode >> isArgument [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isArray [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isAssignment [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isBlock [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isCascade [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isGlobal [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isInstanceVariable [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isLiteral [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isLiteralArray [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isLiteralValue [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isMessage [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isMethod [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isNull [
	^ false
]

{ #category : #testing }
PCGProgramNode >> isPCGProgramNode [
	^ true
]

{ #category : #testing }
PCGProgramNode >> isPragma [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isReturn [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isSelf [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isSequence [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isSuper [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isTemporary [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isThisContext [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isValue [
	<generated>
	^ false
]

{ #category : #testing }
PCGProgramNode >> isVariable [
	<generated>
	^ false
]

{ #category : #converting }
PCGProgramNode >> meta [
	self checkAST.
	^ PCGMetaMetaCodeGenerator new
		visit: self
]

{ #category : #accessing }
PCGProgramNode >> parent [
	^ parent ifNil: [ PCGNullNode new ]
]

{ #category : #accessing }
PCGProgramNode >> parent: anObject [
	parent := anObject
]

{ #category : #converting }
PCGProgramNode >> sourceCode [
	^ RBSimpleFormatter new format: self realAST
]

{ #category : #'parameters-substitution' }
PCGProgramNode >> substituteParametersWith: anObject [
	^ PCGStaticParametersReplacer new
		context: anObject asDictionary;
		visit: self
]
