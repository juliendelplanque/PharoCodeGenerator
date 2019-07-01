Class {
	#name : #PCGMutatorMethodTemplateTest,
	#superclass : #TestCase,
	#category : #'PharoCodeGenerator-Tests-AST'
}

{ #category : #accessing }
PCGMutatorMethodTemplateTest >> mutatorTemplate [
	^ (PCGMethodNode
		selector: #mutatorSelector asPCGTemplateParameter
		arguments: #newValueParameter asPCGTemplateParameter)
		bodyBlock: [ :body | 
			body
				<< (#instanceVariable asPCGTemplateParameter
						assign: #newValueParameter asPCGTemplateParameter) ]
]

{ #category : #tests }
PCGMutatorMethodTemplateTest >> testSubstitute1 [
	| context |
	context := {
		#mutatorSelector -> #foo:.
		#instanceVariable -> #foo asPCGInstanceVariable.
		#newValueParameter -> #aFooObject asPCGArgument
	} asDictionary.
	self
		assert: (self mutatorTemplate substituteParametersWith: context) sourceCode
		equals: 'foo: aFooObject
	<generated>
	foo := aFooObject'
]

{ #category : #tests }
PCGMutatorMethodTemplateTest >> testSubstitute2 [
	| context |
	context := {
		#mutatorSelector -> #name:.
		#instanceVariable -> #name asPCGInstanceVariable.
		#newValueParameter -> #aString asPCGArgument
	} asDictionary.
	self
		assert: (self mutatorTemplate substituteParametersWith: context) sourceCode
		equals: 'name: aString
	<generated>
	name := aString'
]

{ #category : #tests }
PCGMutatorMethodTemplateTest >> testSubstitute3 [
	| context |
	context := {
		#mutatorSelector -> #setName:.
		#instanceVariable -> #name asPCGInstanceVariable.
		#newValueParameter -> #aString asPCGArgument
	} asDictionary.
	self
		assert: (self mutatorTemplate substituteParametersWith: context) sourceCode
		equals: 'setName: aString
	<generated>
	name := aString'
]
