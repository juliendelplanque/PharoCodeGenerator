"
A PCGBehaviorDescriptionTest is a test class for testing the behavior of PCGBehaviorDescription
"
Class {
	#name : #PCGBehaviorDescriptionTest,
	#superclass : #TestCase,
	#category : #'PharoCodeGenerator-Tests-MetaModel'
}

{ #category : #test }
PCGBehaviorDescriptionTest >> testInstallPCGMethod [
	| behavior method |
	behavior := PCGBehaviorDescription new.
	
	self assert: behavior methods isEmpty.
	
	method := (PCGMethodNode selector: #life)
					bodyBlock: [ :body | body << 42 asPCG returnIt ];
					protocol: #accessing;
					yourself.
	
	behavior installPCGMethod: method.
	
	self assert: behavior methods size equals: 1.
	self assert: behavior methods anyOne equals: method.
]

{ #category : #test }
PCGBehaviorDescriptionTest >> testInstallPCGMethodWithSameNameReplacePrevious [
	| behavior method method2 |
	behavior := PCGBehaviorDescription new.
	
	self assert: behavior methods isEmpty.
	
	method := (PCGMethodNode selector: #life)
					bodyBlock: [ :body | body << 42 asPCG returnIt ];
					protocol: #accessing;
					yourself.
					
	method2 := (PCGMethodNode selector: #life)
					bodyBlock: [ :body | body << 43 asPCG returnIt ];
					protocol: #accessing;
					yourself.
	
	behavior installPCGMethod: method.
	
	self assert: behavior methods size equals: 1.
	self assert: behavior methods anyOne equals: method.
	
	behavior installPCGMethod: method2.
	
	self assert: behavior methods size equals: 1.
	self assert: behavior methods anyOne equals: method2.
]

{ #category : #test }
PCGBehaviorDescriptionTest >> testName [
	| behavior |
	behavior := PCGBehaviorDescription new.
	
	behavior name: #foo.
	
	self assert: behavior name class equals: PCGLiteralValueNode.
	self assert: behavior name value equals: #foo
]

{ #category : #test }
PCGBehaviorDescriptionTest >> testSlotsDeclaration [
	| behavior |
	behavior := PCGBehaviorDescription new.
	
	behavior slotsDeclaration: {}.
	
	self assert: behavior slotsDeclaration class equals: PCGArrayNode.
	self assert: behavior slotsDeclaration statements isEmpty
]

{ #category : #test }
PCGBehaviorDescriptionTest >> testTraitCompositionUsed [
	| behavior |
	behavior := PCGBehaviorDescription new.
	
	behavior traitCompositionUsed: {}.
	
	self assert: behavior slotsDeclaration class equals: PCGArrayNode.
	self assert: behavior slotsDeclaration statements isEmpty
]
