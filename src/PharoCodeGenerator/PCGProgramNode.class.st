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

{ #category : #'methods generation' }
PCGProgramNode class >> regenerateEqualAndHash [
	"This commented code regenerate #= and #hash but requires to do a breath first visit of class hierarchy.
	 Thus it uses TreeQuery but we do not want this project as dependency.
	"
	<metaprogramming>
	"((PCGProgramNode breadthFirstIterator: #subclasses)
	select: [ :c | c subclasses isEmpty ])
	collect: [ :class |
		[ 
			|shouldCallSuperForEq shouldCallSuperForHash|
			shouldCallSuperForEq := (class allSuperclassesIncluding: PCGProgramNode) anySatisfy: [ :any | any includesLocalSelector: #= ].
			shouldCallSuperForHash := (class allSuperclassesIncluding: PCGProgramNode) anySatisfy: [ :any | any includesLocalSelector: #hash ].
			class -> ({ 
				PCGTemplatesRepository new
					equalMethodForSlots: class slots withSuperCall: shouldCallSuperForEq.
				PCGTemplatesRepository new
					hashMethodForSlots: class slots withSuperCall: shouldCallSuperForEq.
			} do: [ :m | m installOn: class. m sourceCode ])
		] on: Error do: [ class name , 'does not need #= nor #hash.' logCr ] ]"
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

{ #category : #testing }
PCGProgramNode >> isPCGProgramNode [
	^ true
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
