"
I model RBCascadeNode node for generating Pharo code.
I define a lighter API that aims to ease AST nodes composition.
"
Class {
	#name : #PCGCascadeNode,
	#superclass : #PCGValueNode,
	#traits : 'PCGTMessageReceiver + PCGTStatement',
	#classTraits : 'PCGTMessageReceiver classTrait + PCGTStatement classTrait',
	#instVars : [
		'#target => TypedSlot type: PCGValueNode',
		'#messages => TypedSlot type: (SequenceableCollection withItemsType: PCGMessageNode)'
	],
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #accessing }
PCGCascadeNode class >> classForRealAST [
	^ RBCascadeNode
]

{ #category : #accessing }
PCGCascadeNode class >> instanceVariablesForRealAST [
	^ #(#messages)
]

{ #category : #'instance creation' }
PCGCascadeNode class >> messages: messages [ 
	^ self new
		messages: messages;
		yourself
]

{ #category : #'instance creation' }
PCGCascadeNode class >> target: target [
	^ self new
		target: target;
		yourself
]

{ #category : #visiting }
PCGCascadeNode >> acceptVisitor: aVisitor [
	^ aVisitor visitCascadeNode: self
]

{ #category : #adding }
PCGCascadeNode >> addMessage: aMessageNode [
	self messages add: aMessageNode
]

{ #category : #private }
PCGCascadeNode >> buildMessageNode: aSymbol withAll: arguments [
	"Here we override the message to change the receiver to be the target of cascade."
	^ self addMessage: (PCGMessageNode receiver: self target selector: aSymbol arguments: arguments)
]

{ #category : #initialization }
PCGCascadeNode >> initialize [
	super initialize.
	self messages: OrderedCollection new
]

{ #category : #accessing }
PCGCascadeNode >> messages [
	^ messages
]

{ #category : #accessing }
PCGCascadeNode >> messages: anObject [
	messages := anObject asOrderedCollection
]

{ #category : #accessing }
PCGCascadeNode >> target [
	^ target
]

{ #category : #accessing }
PCGCascadeNode >> target: anObject [
	target := anObject.
	self messages do: [ :m |
		m receiver: self target ]
]
