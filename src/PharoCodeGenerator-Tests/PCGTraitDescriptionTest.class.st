"
A PCGTraitDescriptionTest is a test class for testing the behavior of PCGTraitDescription
"
Class {
	#name : #PCGTraitDescriptionTest,
	#superclass : #TestCase,
	#category : #'PharoCodeGenerator-Tests-MetaModel'
}

{ #category : #running }
PCGTraitDescriptionTest >> tearDown [
	(Smalltalk bindingOf: #PCGFakeTraitGenerated)
		ifNotNil: [ PCGFakeTraitGenerated removeFromSystem ].
	super tearDown
]

{ #category : #test }
PCGTraitDescriptionTest >> testInstallOn [
	| traitDescription |
	traitDescription := PCGTraitDescription new
								name: #PCGFakeTraitGenerated;
								traitCompositionUsed: (#TComparable asPCGGlobal receiveMessage: #+ with: #PCGFakeTrait asPCGGlobal);
								yourself.
								
	(PCGMethodNode selector: #life)
		bodyBlock: [ :b |
			b << 42 asPCG returnIt ];
		installOn: traitDescription.
								
	self assert: (Smalltalk bindingOf: #PCGFakeTraitGenerated) isNil.
	
	traitDescription installOn: self class package.
	
	self assert: (Smalltalk bindingOf: #PCGFakeTraitGenerated) isNotNil.
	self assert: (PCGFakeTraitGenerated canUnderstand: #life).
]
