Extension { #name : #PCGProgramNode }

{ #category : #'*PharoCodeGenerator-Meta' }
PCGProgramNode class >> regenerateEqualAndHash [
	"This commented code regenerate #= and #hash and requires to do a breath first visit of class hierarchy.
	"
	<metaprogramming>
	((BreadthFirstIterator root: PCGProgramNode childrenBlock: #subclasses)
		| [ :c | c subclasses isEmpty ] selectIt
		| [ :class |
		[ 
			|shouldCallSuperForEq shouldCallSuperForHash|
			shouldCallSuperForEq := (class allSuperclassesIncluding: PCGProgramNode) anySatisfy: [ :any | any includesLocalSelector: #= ].
			shouldCallSuperForHash := (class allSuperclassesIncluding: PCGProgramNode) anySatisfy: [ :any | any includesLocalSelector: #hash ].
			class -> ({ 
				PCGTemplatesRepository new
					equalMethodForSlots: class slots withSuperCall: shouldCallSuperForEq.
				PCGTemplatesRepository new
					hashMethodForSlots: class slots withSuperCall: shouldCallSuperForHash.
			} do: [ :m | m installOn: class. m sourceCode ])
		] on: Error do: [ class name , 'does not need #= nor #hash.' logCr ] ] doIt) upToEnd
]
