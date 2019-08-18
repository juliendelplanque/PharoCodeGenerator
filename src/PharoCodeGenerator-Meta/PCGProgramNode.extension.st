Extension { #name : #PCGProgramNode }

{ #category : #'*PharoCodeGenerator-Meta' }
PCGProgramNode class >> regenerateEqualAndHash [
	"This commented code regenerate #= and #hash but requires to do a breath first visit of class hierarchy.
	 Thus it uses TreeQuery but we do not want this project as dependency.
	"
	<metaprogramming>
	"((PCGProgramNode breadthFirstIterator: #subclasses)
	select: [ :c | c subclasses isEmpty ])
	collect: [ :class |
		[ 
			|shouldCallSuperForEq shouldCallSuperForHash|
			shouldCallSuperForEq := (class allSuperclassesIncluding: PCGProgramNode) anySatisfy: [ :any | any includesLocalSelector: #= ].
			shouldCallSuperForHash := (class allSuperclassesIncluding: PCGProgramNode) anySatisfy: [ :any | any includesLocalSelector: #hash ].
			class -> ({ 
				PCGTemplatesRepository new
					equalMethodForSlots: class slots withSuperCall: shouldCallSuperForEq.
				PCGTemplatesRepository new
					hashMethodForSlots: class slots withSuperCall: shouldCallSuperForEq.
			} do: [ :m | m installOn: class. m sourceCode ])
		] on: Error do: [ class name , 'does not need #= nor #hash.' logCr ] ]"
]
