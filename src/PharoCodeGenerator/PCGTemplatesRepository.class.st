Class {
	#name : #PCGTemplatesRepository,
	#superclass : #Object,
	#category : #'PharoCodeGenerator-Templates'
}

{ #category : #builders }
PCGTemplatesRepository >> accessorForSlotNamed: slotName [
	^ self accessorMethodTemplate substituteParametersWith: { 
		#accessorSelector -> slotName.
		#slotName -> slotName asPCGInstanceVariable } asDictionary
]

{ #category : #templates }
PCGTemplatesRepository >> accessorMethodTemplate [
	^ (PCGMethodNode selector: #accessorSelector asPCGTemplateParameter)
		protocol: 'accessing';
		bodyBlock: [ :body |
			body << #slotName asPCGTemplateParameter returnIt ]
]

{ #category : #builders }
PCGTemplatesRepository >> equalMethodForSlots: aCollectionOfSlots [
	^ self equalMethodForSlots: aCollectionOfSlots withSuperCall: false
]

{ #category : #builders }
PCGTemplatesRepository >> equalMethodForSlots: aCollectionOfSlots withSuperCall: shouldCallSuper [
	| equalNodes testExpression |
	aCollectionOfSlots
		ifEmpty: [ self error: 'The collection of slots is empty, can not generate #=' ].
	
	equalNodes := aCollectionOfSlots collect: [ :slot |
		slot name asPCGInstanceVariable
			receiveMessage: #=
			with: (#anObject asPCGArgument receiveMessage: slot name)
		] as: OrderedCollection.
	
	shouldCallSuper ifTrue: [ 
		equalNodes addFirst: (#super asPCGNode receiveMessage: #= with: #anObject asPCGArgument) ].
	
	testExpression := equalNodes reversed reduce: [ :rightNode :leftNode |
		leftNode receiveMessage: #and: with: rightNode inBlock ].
	^ (self equalMethodTemplate substituteParametersWith: { 
		#testExpression -> testExpression })
]

{ #category : #templates }
PCGTemplatesRepository >> equalMethodTemplate [
	^ (PCGMethodNode selector: #= arguments: { #anObject asPCGArgument })
				bodyBlock: [ :body |
					body << ((#self asPCGNode receiveMessage: #== with: #anObject asPCGArgument )
									receiveMessage: #ifTrue:
									with: true asPCG returnIt inBlock).
					body << (((#self asPCGNode receiveClass) receiveMessage: #= with: #anObject asPCGArgument receiveClass)
									receiveMessage: #ifFalse:
									with: false asPCG returnIt inBlock).
					body << #testExpression asPCGTemplateParameter returnIt ];
				protocol: 'comparing';
				yourself
]

{ #category : #builders }
PCGTemplatesRepository >> hashMethodForSlots: aCollectionOfSlots [
	^ self hashMethodForSlots: aCollectionOfSlots withSuperCall: false
]

{ #category : #builders }
PCGTemplatesRepository >> hashMethodForSlots: aCollectionOfSlots withSuperCall: shouldCallSuper [
	| hashNodes hashExpression |
	aCollectionOfSlots
		ifEmpty: [ self error: 'The collection of slots is empty, can not generate #hash' ].
	
	hashNodes := aCollectionOfSlots collect: [ :slot |
		slot name asPCGInstanceVariable
			receiveMessage: #hash
		] as: OrderedCollection.
	
	shouldCallSuper ifTrue: [ 
		hashNodes addFirst: (#super asPCGNode receiveMessage: #hash) ].
	
	hashExpression := hashNodes reduce: [ :leftNode :rightNode |
		leftNode receiveMessage: #bitXor: with: rightNode ].
	^ (self hashMethodTemplate substituteParametersWith: { 
		#hashExpression -> hashExpression })
]

{ #category : #templates }
PCGTemplatesRepository >> hashMethodTemplate [
	^ (PCGMethodNode selector: #hash)
				bodyBlock: [ :body |
					body << #hashExpression asPCGTemplateParameter returnIt ];
				protocol: 'comparing';
				yourself
]

{ #category : #builders }
PCGTemplatesRepository >> mutatorForSlotNamed: slotName [
	^ self mutatorForSlotNamed: slotName argumentName: #anObject
]

{ #category : #builders }
PCGTemplatesRepository >> mutatorForSlotNamed: slotName argumentName: argumentName [
	^ self mutatorMethodTemplate substituteParametersWith: { 
		#mutatorSelector -> (slotName , ':') asSymbol.
		#argumentName -> argumentName asPCGArgument.
		#slotName -> slotName asPCGInstanceVariable } asDictionary
]

{ #category : #templates }
PCGTemplatesRepository >> mutatorMethodTemplate [
	^ (PCGMethodNode selector: #mutatorSelector asPCGTemplateParameter arguments: { #argumentName asPCGTemplateParameter })
		protocol: 'accessing';
		bodyBlock: [ :body |
			body << (#slotName asPCGTemplateParameter assign: #argumentName asPCGTemplateParameter) ]
]

{ #category : #builders }
PCGTemplatesRepository >> type: classOfTypeToTest testMethodFor: classToInstallIn [
	^ self typeTestMethodTemplate substituteParametersWith: { 
		#selector -> ('is' , classOfTypeToTest name) asSymbol.
		#booleanToReturn -> (classOfTypeToTest = classToInstallIn) asPCG } asDictionary
]

{ #category : #templates }
PCGTemplatesRepository >> typeTestMethodTemplate [
	^ (PCGMethodNode selector: #selector asPCGTemplateParameter)
		protocol: 'testing';
		bodyBlock: [ :body | body << #booleanToReturn asPCGTemplateParameter returnIt ]
]
