Class {
	#name : #PCGClassDescription,
	#superclass : #PCGBehaviorDescription,
	#instVars : [
		'superclassName'
	],
	#category : #'PharoCodeGenerator-MetaModel'
}

{ #category : #accessing }
PCGClassDescription >> environment [
	^ self class environment
]

{ #category : #initialization }
PCGClassDescription >> initialize [
	super initialize.
	self superclassName: #Object.
]

{ #category : #installing }
PCGClassDescription >> installOn: aRPackage [
	self superclass
		subclass: self name
		slots: self slots
		classVariables: {}
		package: aRPackage name.
	self methods do: [ :method | 
		method installOn: (self class environment at: self name) ]
]

{ #category : #installing }
PCGClassDescription >> superclass [
	^ self environment at: self superclassName
]

{ #category : #accessing }
PCGClassDescription >> superclassName [
	^ superclassName
]

{ #category : #accessing }
PCGClassDescription >> superclassName: anObject [
	superclassName := anObject
]
