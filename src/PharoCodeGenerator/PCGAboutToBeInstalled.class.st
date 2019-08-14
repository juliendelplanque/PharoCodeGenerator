"
I am a notification created when a PCG method is about to be installed on a class.
"
Class {
	#name : #PCGAboutToBeInstalled,
	#superclass : #Notification,
	#instVars : [
		'method',
		'installTarget'
	],
	#category : #'PharoCodeGenerator-Notifications'
}

{ #category : #'instance creation' }
PCGAboutToBeInstalled class >> signalForMethod: method installTarget: classToInstallOn [
	<generated>
	^ self new
		method: method;
		classToInstallOn: classToInstallOn;
		signal
]

{ #category : #accessing }
PCGAboutToBeInstalled >> installTarget [
	^ installTarget
]

{ #category : #accessing }
PCGAboutToBeInstalled >> installTarget: anObject [
	installTarget := anObject
]

{ #category : #accessing }
PCGAboutToBeInstalled >> method [
	^ method
]

{ #category : #accessing }
PCGAboutToBeInstalled >> method: anObject [
	method := anObject
]
