"
I substitute PCGTemplateParameterNodes with objects for which its key is equal to the template parameter name in my #context.
"
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
PCGStaticParametersReplacer >> visitArrayNode: anArrayNode [
	<generated>
	^ PCGArrayNode new
		statements:
			(anArrayNode statements collect: [ :toVisit | self visit: toVisit ])
				flattened;
		yourself
]

{ #category : #visiting }
PCGStaticParametersReplacer >> visitBlockNode: aBlockNode [
	<generated>
	^ PCGBlockNode new
		arguments:
			(aBlockNode arguments collect: [ :toVisit | self visit: toVisit ])
				flattened;
		body: (self visit: aBlockNode body);
		yourself
]

{ #category : #visiting }
PCGStaticParametersReplacer >> visitCascadeNode: aCascadeNode [
	<generated>
	^ PCGCascadeNode new
		target: (self visit: aCascadeNode target);
		messages:
			(aCascadeNode messages collect: [ :toVisit | self visit: toVisit ])
				flattened;
		yourself
]

{ #category : #visiting }
PCGStaticParametersReplacer >> visitCompositeTemplateParameter: aCompositeTemplateParameter [
	aCompositeTemplateParameter templateParameters
		detect: [ :p | (self context includesKey: p name) not ]
		ifFound: [ :p | self error: 'Template parameter not found in the context: #' , p name ].
		
	
	^ PCGStaticASTCopier visit: (aCompositeTemplateParameter transform: (aCompositeTemplateParameter templateParameters collect: [ :p | self context at: p name ]))
]

{ #category : #visiting }
PCGStaticParametersReplacer >> visitLiteralArrayNode: aLiteralArrayNode [
	<generated>
	^ PCGLiteralArrayNode new
		contents:
			(aLiteralArrayNode contents
				collect: [ :toVisit | self visit: toVisit ]) flattened;
		yourself
]

{ #category : #visiting }
PCGStaticParametersReplacer >> visitMessageNode: aMessageNode [
	<generated>
	^ PCGMessageNode new
		receiver: (self visit: aMessageNode receiver);
		selector: (self visit: aMessageNode selector);
		arguments:
			(aMessageNode arguments collect: [ :toVisit | self visit: toVisit ])
				flattened;
		yourself
]

{ #category : #visiting }
PCGStaticParametersReplacer >> visitMethodNode: aMethodNode [
	^ aMethodNode class new
		selector: (self visit: aMethodNode selector);
		body: (self visit: aMethodNode body);
		arguments:
			(aMethodNode arguments collect: [ :toVisit | self visit: toVisit ])
				flattened;
		pragmas:
			(aMethodNode pragmas collect: [ :toVisit | self visit: toVisit ])
				flattened;
		protocol: (self visit: aMethodNode protocol);
		yourself
]

{ #category : #visiting }
PCGStaticParametersReplacer >> visitPragmaNode: aPragmaNode [
	<generated>
	^ PCGPragmaNode new
		selector: (self visit: aPragmaNode selector);
		arguments:
			(aPragmaNode arguments collect: [ :toVisit | self visit: toVisit ])
				flattened;
		yourself
]

{ #category : #visiting }
PCGStaticParametersReplacer >> visitSequenceNode: aSequenceNode [
	<generated>
	^ PCGSequenceNode new
		statements:
			(aSequenceNode statements collect: [ :toVisit | self visit: toVisit ])
				flattened;
		temporaries:
			(aSequenceNode temporaries collect: [ :toVisit | self visit: toVisit ])
				flattened;
		yourself
]

{ #category : #visiting }
PCGStaticParametersReplacer >> visitTemplateParameter: aTemplateParameter [
	^ self context
		at: aTemplateParameter name
		ifPresent: [ :toInject | 
			PCGStaticASTCopier visit: (aTemplateParameter transform: toInject) ]
		ifAbsent: [ self error: 'Template parameter not found in the context: #' , aTemplateParameter name ]
]
