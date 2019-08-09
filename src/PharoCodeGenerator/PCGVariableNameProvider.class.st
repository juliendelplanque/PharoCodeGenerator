Class {
	#name : #PCGVariableNameProvider,
	#superclass : #Object,
	#instVars : [
		'level'
	],
	#category : #'PharoCodeGenerator-Visitors'
}

{ #category : #'level management' }
PCGVariableNameProvider >> decreaseLevel [
	self level = self minimalLevel
		ifTrue: [ self error: 'Can not decrease under level ' , self minimalLevel asString ].
	
	self level: self level - 1
]

{ #category : #'level management' }
PCGVariableNameProvider >> increaseLevel [
	self level: self level + 1
]

{ #category : #initialization }
PCGVariableNameProvider >> initialize [
	super initialize.
	self level: self minimalLevel
]

{ #category : #accessing }
PCGVariableNameProvider >> level [
	^ level
]

{ #category : #accessing }
PCGVariableNameProvider >> level: anObject [
	level := anObject
]

{ #category : #accessing }
PCGVariableNameProvider >> minimalLevel [
	^ 0
]

{ #category : #'name generation' }
PCGVariableNameProvider >> nameForVariable: aSymbol [
	self level = self minimalLevel
		ifTrue: [ ^ aSymbol ].
		
	^ (aSymbol , self level asString) asSymbol
]
