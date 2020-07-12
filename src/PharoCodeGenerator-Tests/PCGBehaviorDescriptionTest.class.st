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
