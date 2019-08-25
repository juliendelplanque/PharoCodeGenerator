Class {
	#name : #PCGClassDescription,
	#superclass : #PCGBehaviorDescription,
	#instVars : [
		'superclass'
	],
	#category : #'PharoCodeGenerator-MetaModel'
}

{ #category : #installing }
PCGClassDescription >> installOn: aRPackage [
	
]

{ #category : #accessing }
PCGClassDescription >> superclass [
	^ superclass
]

{ #category : #accessing }
PCGClassDescription >> superclass: anObject [
	superclass := anObject
]
