Class {
	#name : #PCGClassDescription,
	#superclass : #PCGBehaviorDescription,
	#instVars : [
		'superclassName',
		'classVariables'
	],
	#category : #'PharoCodeGenerator-MetaModel'
}

{ #category : #accessing }
PCGClassDescription >> classVariables [
	^ classVariables
]

{ #category : #accessing }
PCGClassDescription >> classVariables: anObject [
	classVariables := anObject
]

{ #category : #accessing }
PCGClassDescription >> environment [
	^ self class environment
]

{ #category : #initialization }
PCGClassDescription >> initialize [
	super initialize.
	self superclassName: #Object.
	self classVariables: #()
]

{ #category : #installing }
PCGClassDescription >> installOn: aRPackage [
	^ aRPackage installPCGClass: self
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
