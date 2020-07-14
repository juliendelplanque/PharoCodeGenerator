"
A PCGPackageDescriptionTest is a test class for testing the behavior of PCGPackageDescription
"
Class {
	#name : #PCGPackageDescriptionTest,
	#superclass : #TestCase,
	#category : #'PharoCodeGenerator-Tests-MetaModel'
}

{ #category : #test }
PCGPackageDescriptionTest >> testInstallPCGPackageTagDescription [
	| package tag |
	package := PCGPackageDescription new.
	tag := PCGPackageTagDescription new.
	
	self assert: package tags isEmpty.
	
	package installPCGPackageTagDescription: tag.
	
	self assert: package tags size equals: 1.
	self assert: package tags anyOne equals: tag.
]
