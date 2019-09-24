Class {
	#name : #PCGParentSetter,
	#superclass : #PCGGenericVisitor,
	#instVars : [
		'parentsStack'
	],
	#category : #'PharoCodeGenerator-Visitors'
}

{ #category : #initialization }
PCGParentSetter >> initialize [
	super initialize.
	parentsStack := Stack new
]

{ #category : #visiting }
PCGParentSetter >> visitProgramNode: aProgramNode [
	parentsStack ifNotEmpty: [ 
		aProgramNode parent: parentsStack top ].
	parentsStack push: aProgramNode.
	"Visit children."
	aProgramNode children do: [ :child | self visit: child ].
	parentsStack pop
]
