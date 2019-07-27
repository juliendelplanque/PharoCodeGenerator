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
