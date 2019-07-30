Class {
	#name : #PCGHandwrittenMethodAlreadyExist,
	#superclass : #PCGError,
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
