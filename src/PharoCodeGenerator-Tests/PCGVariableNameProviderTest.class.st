"
A PCGVariableProviderTest is a test class for testing the behavior of PCGVariableProvider
"
Class {
	#name : #PCGVariableNameProviderTest,
	#superclass : #TestCase,
	#instVars : [
		'variableProvider'
	],
	#category : #'PharoCodeGenerator-Tests-Visitors'
}

{ #category : #running }
PCGVariableNameProviderTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
	variableProvider := PCGVariableNameProvider new.
]

{ #category : #test }
PCGVariableNameProviderTest >> testDecreaseLevel [
	self assert: variableProvider level equals: 0.
	
	variableProvider increaseLevel.
	
	self assert: variableProvider level equals: 1.
	
	variableProvider decreaseLevel.
	
	self assert: variableProvider level equals: 0.
	
	self should: [ variableProvider decreaseLevel ] raise: Error
]

{ #category : #test }
PCGVariableNameProviderTest >> testIncreaseLevel [
	self assert: variableProvider level equals: 0.
	
	variableProvider increaseLevel.
	
	self assert: variableProvider level equals: 1.
]

{ #category : #test }
PCGVariableNameProviderTest >> testNameForVariable [
	self assert: (variableProvider nameForVariable: #foo) equals: #foo.
	
	variableProvider increaseLevel.
	
	self assert: (variableProvider nameForVariable: #foo) equals: #foo1.
	
	variableProvider increaseLevel.
	
	self assert: (variableProvider nameForVariable: #foo) equals: #foo2.
	
	variableProvider decreaseLevel.
	

	self assert: (variableProvider nameForVariable: #foo) equals: #foo1.
]
