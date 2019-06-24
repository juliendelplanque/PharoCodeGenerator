Trait {
	#name : #PCGTMessageReceiver,
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #dsl }
PCGTMessageReceiver >> receiveMessage: aSymbol with: arguments [
	^ PCGMessageNode receiver: self selector: aSymbol arguments: {arguments}
]

{ #category : #dsl }
PCGTMessageReceiver >> receiveMessage: aSymbol with: argument1 with: argument2 [
	^ PCGMessageNode receiver: self selector: aSymbol arguments: {argument1 . argument2}
]

{ #category : #dsl }
PCGTMessageReceiver >> receiveMessage: aSymbol with: argument1 with: argument2 with: argument3 [
	^ PCGMessageNode receiver: self selector: aSymbol arguments: {argument1 . argument2. argument3}
]

{ #category : #dsl }
PCGTMessageReceiver >> receiveMessage: aSymbol withAll: arguments [
	^ PCGMessageNode receiver: self selector: aSymbol arguments: arguments
]
