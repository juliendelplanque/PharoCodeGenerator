"
I am the error created when some parameters of a template context are not set during substitution.
"
Class {
	#name : #PCGIncompleteTemplateContext,
	#superclass : #PCGError,
	#instVars : [
		'missingParameter'
	],
	#category : #'PharoCodeGenerator-Errors'
}

{ #category : #'instance creation' }
PCGIncompleteTemplateContext class >> missingParameter: missingParameter [
	<generated>
	^ self new
		missingParameter: missingParameter;
		yourself
]

{ #category : #accessing }
PCGIncompleteTemplateContext >> missingParameter [
	^ missingParameter
]

{ #category : #accessing }
PCGIncompleteTemplateContext >> missingParameter: anObject [
	missingParameter := anObject
]
