"
A PCGSmalltalkImageTest is a test class for testing the behavior of PCGSmalltalkImage
"
Class {
	#name : #PCGSmalltalkImageTest,
	#superclass : #TestCase,
	#category : #'PharoCodeGenerator-Tests-MetaModel'
}

{ #category : #test }
PCGSmalltalkImageTest >> testInstallPCGPackageDescription [
	| image package |
	image := PCGSmalltalkImage new.
	package := PCGPackageDescription new.
	
	self assert: image packages isEmpty.
	
	image installPCGPackageDescription: package.
	
	self assert: image packages size equals: 1.
	self assert: image packages anyOne equals: package.
]
