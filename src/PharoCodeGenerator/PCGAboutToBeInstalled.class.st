"
I am a notification created when a PCG method is about to be installed on a class.
"
Class {
	#name : #PCGAboutToBeInstalled,
	#superclass : #Notification,
	#instVars : [
		'installTarget',
		'entity'
	],
	#category : #'PharoCodeGenerator-Notifications'
}

{ #category : #'instance creation' }
PCGAboutToBeInstalled class >> signalForEntity: method installTarget: classToInstallOn [
	<generated>
	^ self new
		entity: method;
		installTarget: classToInstallOn;
		signal
]

{ #category : #accessing }
PCGAboutToBeInstalled >> entity [
	^ entity
]

{ #category : #accessing }
PCGAboutToBeInstalled >> entity: anObject [
	entity := anObject
]

{ #category : #accessing }
PCGAboutToBeInstalled >> installTarget [
	^ installTarget
]

{ #category : #accessing }
PCGAboutToBeInstalled >> installTarget: anObject [
	installTarget := anObject
]
