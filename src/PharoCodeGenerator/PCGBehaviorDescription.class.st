Class {
	#name : #PCGBehaviorDescription,
	#superclass : #Object,
	#traits : 'PCGTInstallableEntity',
	#classTraits : 'PCGTInstallableEntity classTrait',
	#instVars : [
		'name',
		'methods',
		'traitCompositionUsed',
		'slotsDeclaration'
	],
	#category : #'PharoCodeGenerator-MetaModel'
}

{ #category : #converting }
PCGBehaviorDescription >> asPCGGlobal [
	^ self name evaluate asSymbol asPCGGlobal
]

{ #category : #initialization }
PCGBehaviorDescription >> initialize [
	super initialize.
	self methods: OrderedCollection new.
	self slotsDeclaration: {} asPCG.
	self traitCompositionUsed: {} asPCG
]

{ #category : #installing }
PCGBehaviorDescription >> installPCGMethod: aPCGMethodNode [
	self methods
		detect: [ :m | m selector = aPCGMethodNode selector ]
		ifFound: [ :m | self methods remove: m ].

	self methods
		add: aPCGMethodNode
]

{ #category : #testing }
PCGBehaviorDescription >> isPCGClass [
	^ false
]

{ #category : #testing }
PCGBehaviorDescription >> isPCGTrait [
	^ false
]

{ #category : #accessing }
PCGBehaviorDescription >> methods [
	^ methods
]

{ #category : #accessing }
PCGBehaviorDescription >> methods: anObject [
	methods := anObject
]

{ #category : #accessing }
PCGBehaviorDescription >> name [
	^ name
]

{ #category : #accessing }
PCGBehaviorDescription >> name: anObject [
	name := anObject asPCG
]

{ #category : #printing }
PCGBehaviorDescription >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	aStream nextPutAll: ([ self name evaluate ] on: Error do: [ 'Can not generate name.' ]).
	aStream nextPut: $)
]

{ #category : #accessing }
PCGBehaviorDescription >> slotsDeclaration [
	^ slotsDeclaration
]

{ #category : #accessing }
PCGBehaviorDescription >> slotsDeclaration: anObject [
	slotsDeclaration := anObject asPCG
]

{ #category : #accessing }
PCGBehaviorDescription >> traitCompositionUsed [
	^ traitCompositionUsed
]

{ #category : #accessing }
PCGBehaviorDescription >> traitCompositionUsed: anObject [
	traitCompositionUsed := anObject asPCG
]
