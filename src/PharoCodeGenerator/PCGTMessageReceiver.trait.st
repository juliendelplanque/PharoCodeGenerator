Trait {
	#name : #PCGTMessageReceiver,
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #private }
PCGTMessageReceiver >> buildMessageNode: aSymbol withAll: arguments [
	^ PCGMessageNode receiver: self selector: aSymbol arguments: arguments
]

{ #category : #dsl }
PCGTMessageReceiver >> receiveMessage: aSymbol [
	^ self receiveMessage: aSymbol withAll: Array empty
]

{ #category : #dsl }
PCGTMessageReceiver >> receiveMessage: aSymbol with: arguments [
	^ self receiveMessage: aSymbol withAll: {arguments}
]

{ #category : #dsl }
PCGTMessageReceiver >> receiveMessage: aSymbol with: argument1 with: argument2 [
	^ self receiveMessage: aSymbol withAll: {argument1 . argument2}
]

{ #category : #dsl }
PCGTMessageReceiver >> receiveMessage: aSymbol with: argument1 with: argument2 with: argument3 [
	^ self receiveMessage: aSymbol withAll: {argument1 . argument2. argument3}
]

{ #category : #dsl }
PCGTMessageReceiver >> receiveMessage: aSymbol withAll: arguments [
	^ self buildMessageNode: aSymbol withAll: arguments
]
