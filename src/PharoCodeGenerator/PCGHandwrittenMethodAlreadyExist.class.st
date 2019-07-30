"
I am the warning raised when an attempt is made to install a method in a class where there is already a method with the same selector that has no <generated> pragma.
"
Class {
	#name : #PCGHandwrittenMethodAlreadyExist,
	#superclass : #Warning,
	#instVars : [
		'method'
	],
	#category : #'PharoCodeGenerator-Errors'
}

{ #category : #'instance creation' }
PCGHandwrittenMethodAlreadyExist class >> signalForMethod: method [
	<generated>
	^ self new
		method: method;
		signal
]

{ #category : #accessing }
PCGHandwrittenMethodAlreadyExist >> method [
	^ method
]

{ #category : #accessing }
PCGHandwrittenMethodAlreadyExist >> method: anObject [
	method := anObject
]
