Trait {
	#name : #PCGTMessageReceiver,
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #dsl }
PCGTMessageReceiver >> receiveMessage: aSymbol with: arguments [
	^ PCGMessageNode receiver: self selector: aSymbol arguments: arguments
]
