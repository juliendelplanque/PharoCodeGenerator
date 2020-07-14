Class {
	#name : #PCGPackageTagDescription,
	#superclass : #PCGAbstractBehaviorsContainer,
	#category : #'PharoCodeGenerator-MetaModel'
}

{ #category : #installing }
PCGPackageTagDescription >> installOn: aPackage [
	aPackage installPCGPackageTagDescription: self
]
