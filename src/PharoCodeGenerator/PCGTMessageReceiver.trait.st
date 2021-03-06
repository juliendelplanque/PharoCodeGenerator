"
I provide the DSL for nodes that can receive message.
"
Trait {
	#name : #PCGTMessageReceiver,
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #private }
PCGTMessageReceiver >> buildMessageNode: aSymbol withAll: arguments [
	^ PCGMessageNode receiver: self selector: aSymbol arguments: arguments
]

{ #category : #'dsl-sugar' }
PCGTMessageReceiver >> receiveClass [
	^ self receiveMessage: #class
]

{ #category : #dsl }
PCGTMessageReceiver >> receiveMessage: aSymbol [
	^ self receiveMessage: aSymbol withAll: Array empty
]

{ #category : #'dsl-sugar' }
PCGTMessageReceiver >> receiveMessage: aSymbol if: conditionBlock [
	^ self receiveMessage: aSymbol withAll: Array empty if: conditionBlock
]

{ #category : #dsl }
PCGTMessageReceiver >> receiveMessage: aSymbol with: argument [
	^ self receiveMessage: aSymbol withAll: {argument}
]

{ #category : #'dsl-sugar' }
PCGTMessageReceiver >> receiveMessage: aSymbol with: argument if: conditionBlock [
	^ self receiveMessage: aSymbol withAll: {argument} if: conditionBlock
]

{ #category : #dsl }
PCGTMessageReceiver >> receiveMessage: aSymbol with: argument1 with: argument2 [
	^ self receiveMessage: aSymbol withAll: {argument1 . argument2}
]

{ #category : #'dsl-sugar' }
PCGTMessageReceiver >> receiveMessage: aSymbol with: argument1 with: argument2 if: conditionBlock [
	^ self receiveMessage: aSymbol withAll: {argument1. argument2} if: conditionBlock
]

{ #category : #dsl }
PCGTMessageReceiver >> receiveMessage: aSymbol with: argument1 with: argument2 with: argument3 [
	^ self receiveMessage: aSymbol withAll: {argument1 . argument2. argument3}
]

{ #category : #'dsl-sugar' }
PCGTMessageReceiver >> receiveMessage: aSymbol with: argument1 with: argument2 with: argument3 if: conditionBlock [
	^ self receiveMessage: aSymbol withAll: {argument1. argument2. argument3} if: conditionBlock
]

{ #category : #dsl }
PCGTMessageReceiver >> receiveMessage: aSymbol withAll: arguments [
	^ self buildMessageNode: aSymbol withAll: arguments
]

{ #category : #'dsl-sugar' }
PCGTMessageReceiver >> receiveMessage: aSymbol withAll: arguments if: conditionBlock [
	conditionBlock value
		ifFalse: [ ^ self ].

	^ self receiveMessage: aSymbol withAll: arguments
]

{ #category : #'dsl-sugar' }
PCGTMessageReceiver >> receiveNew [
	^ self receiveMessage: #new
]

{ #category : #'dsl-sugar' }
PCGTMessageReceiver >> receiveYourself [
	^ self receiveMessage: #yourself
]
