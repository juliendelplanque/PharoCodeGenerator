Class {
	#name : #PCGBehaviorDescription,
	#superclass : #Object,
	#instVars : [
		'name',
		'slots',
		'methods'
	],
	#category : #'PharoCodeGenerator-MetaModel'
}

{ #category : #initialization }
PCGBehaviorDescription >> initialize [
	super initialize.
	self methods: OrderedCollection new.
	self slots: OrderedCollection new.
]

{ #category : #installing }
PCGBehaviorDescription >> installPCGMethod: aPCGMethodNode [
	self methods
		detect: [ :m | m selector = aPCGMethodNode selector ]
		ifFound: [ :m | self methods remove: m ].

	self methods
		add: aPCGMethodNode
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
	name := anObject
]

{ #category : #accessing }
PCGBehaviorDescription >> slots [
	^ slots
]

{ #category : #accessing }
PCGBehaviorDescription >> slots: anObject [
	slots := anObject
]
