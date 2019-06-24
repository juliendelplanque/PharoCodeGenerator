Trait {
	#name : #PCGTCascadeTarget,
	#category : #'PharoCodeGenerator-Traits'
}

{ #category : #dsl }
PCGTCascadeTarget >> asCascade [
	^ self asCascadeTarget
]

{ #category : #dsl }
PCGTCascadeTarget >> asCascadeTarget [
	^ PCGCascadeNode target: self
]
