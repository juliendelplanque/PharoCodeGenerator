Class {
	#name : #PCGTraitDescription,
	#superclass : #PCGBehaviorDescription,
	#category : #'PharoCodeGenerator-MetaModel'
}

{ #category : #installing }
PCGTraitDescription >> installOn: aRPackage [
	^ aRPackage installPCGTrait: self
]

{ #category : #testing }
PCGTraitDescription >> isPCGTrait [
	^ true
]
