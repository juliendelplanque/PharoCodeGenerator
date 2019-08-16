"
A PCGTemplateParameterTest is a test class for testing the behavior of PCGTemplateParameter
"
Class {
	#name : #PCGTemplateParameterTest,
	#superclass : #TestCase,
	#instVars : [
		'templateParameter'
	],
	#category : #'PharoCodeGenerator-Tests-AST'
}

{ #category : #running }
PCGTemplateParameterTest >> setUp [
	super setUp.
	templateParameter := PCGTemplateParameter name: #foo.
]

{ #category : #test }
PCGTemplateParameterTest >> testBeArgument [
	| argument |
	templateParameter beArgument.
	
	argument := templateParameter transform: #x.
	self assert: argument class equals: PCGArgumentNode.
	self assert: argument name equals: #x.
]

{ #category : #test }
PCGTemplateParameterTest >> testBeGlobal [
	| argument |
	templateParameter beGlobal.
	
	argument := templateParameter transform: #X.
	self assert: argument class equals: PCGGlobalNode.
	self assert: argument name equals: #X.
]

{ #category : #test }
PCGTemplateParameterTest >> testBeInstanceVariable [
	| argument |
	templateParameter beInstanceVariable.
	
	argument := templateParameter transform: #x.
	self assert: argument class equals: PCGInstanceVariableNode.
	self assert: argument name equals: #x.
]

{ #category : #test }
PCGTemplateParameterTest >> testBeTemporary [
	| argument |
	templateParameter beTemporary.
	
	argument := templateParameter transform: #x.
	self assert: argument class equals: PCGTemporaryNode.
	self assert: argument name equals: #x.
]

{ #category : #test }
PCGTemplateParameterTest >> testEqualGreater [
	templateParameter => #yourself.
	
	self assert: templateParameter transformationBlock equals: #yourself
]
