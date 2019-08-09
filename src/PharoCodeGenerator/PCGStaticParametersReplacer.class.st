Class {
	#name : #PCGStaticParametersReplacer,
	#superclass : #PCGStaticASTCopier,
	#instVars : [
		'context'
	],
	#category : #'PharoCodeGenerator-Visitors'
}

{ #category : #accessing }
PCGStaticParametersReplacer >> context [
	^ context
]

{ #category : #accessing }
PCGStaticParametersReplacer >> context: anObject [
	context := anObject
]

{ #category : #visiting }
PCGStaticParametersReplacer >> visitTemplateParameter: aTemplateParameter [
	^ self context
		at: aTemplateParameter name
		ifPresent: [ :toInject | PCGStaticASTCopier visit: toInject ]
		ifAbsent: [ self error: 'Template parameter not found in the context: #' , aTemplateParameter name ]
]
