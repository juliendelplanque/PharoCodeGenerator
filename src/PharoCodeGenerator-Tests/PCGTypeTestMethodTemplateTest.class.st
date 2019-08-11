Class {
	#name : #PCGTypeTestMethodTemplateTest,
	#superclass : #TestCase,
	#instVars : [
		'template'
	],
	#category : #'PharoCodeGenerator-Tests'
}

{ #category : #running }
PCGTypeTestMethodTemplateTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
	template := (PCGMethodNode selector: #isMyObject)
		bodyBlock: [ :body |
			body << #isMyObjectBoolean asPCGTemplateParameter returnIt ];
		yourself.
]

{ #category : #tests }
PCGTypeTestMethodTemplateTest >> testSubstitute1 [
	self assert: (template substituteParametersWith: { 
		#isMyObjectBoolean -> true asPCG }) sourceCode equals: 'isMyObject
	<generated>
	^ true'
]

{ #category : #tests }
PCGTypeTestMethodTemplateTest >> testSubstitute2 [
	self assert: (template substituteParametersWith: { 
		#isMyObjectBoolean -> false asPCG }) sourceCode equals: 'isMyObject
	<generated>
	^ false'
]
