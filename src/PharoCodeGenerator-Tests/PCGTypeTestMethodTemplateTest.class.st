Class {
	#name : #PCGTypeTestMethodTemplateTest,
	#superclass : #PCGTestCase,
	#instVars : [
		'template'
	],
	#category : #'PharoCodeGenerator-Tests-Templates'
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
	self assertSourceCodeOf: (template substituteParametersWith: { 
		#isMyObjectBoolean -> true asPCG }) equals: 'isMyObject
  < generated>
  ^true'
]

{ #category : #tests }
PCGTypeTestMethodTemplateTest >> testSubstitute2 [
	self assertSourceCodeOf: (template substituteParametersWith: { 
		#isMyObjectBoolean -> false asPCG }) equals: 'isMyObject
  < generated>
  ^false'
]
