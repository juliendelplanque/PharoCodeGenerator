Extension { #name : #PCGProgramNode }

{ #category : #'*PharoCodeGenerator-Meta' }
PCGProgramNode class >> regenerateEqualAndHash [
	"This commented code regenerate #= and #hash and requires to do a breath first visit of class hierarchy.
	"

	<script>
	<metaprogramming>
	((BreadthFirstIterator
		root: PCGProgramNode
		childrenBlock: #subclasses) | [ :c | c subclasses isEmpty ] selectIt
		|
			[ :class | 
			[ | shouldCallSuperForEq shouldCallSuperForHash |
			shouldCallSuperForEq := (class
				allSuperclassesIncluding: PCGProgramNode)
				anySatisfy: [ :any | any includesLocalSelector: #= ].
			shouldCallSuperForHash := (class
				allSuperclassesIncluding: PCGProgramNode)
				anySatisfy: [ :any | any includesLocalSelector: #hash ].
			class
				->
					({(PCGTemplatesRepository new
						equalMethodForSlots: class slots
						withSuperCall: shouldCallSuperForEq).
					(PCGTemplatesRepository new
						hashMethodForSlots: class slots
						withSuperCall: shouldCallSuperForHash)}
						do: [ :m | 
							m installOn: class.
							m sourceCode ]) ]
				on: Error
				do: [ class name , 'does not need #= nor #hash.' traceCr ] ] doIt)
		upToEnd
]

{ #category : #'*PharoCodeGenerator-Meta' }
PCGProgramNode class >> regenerateTypeTestMethods [
	<script>
	<metaprogramming>
	| template |
	template := (PCGMethodNode selector: #typeClass asPCGTemplateParameter => [ :class | ('is' , ((class name allButFirst: 'PCG' size) allButLast: 'Node' size)) asSymbol ])
						protocol: 'testing';
						bodyBlock: [ :body | 
							body << ((#typeClass asPCGTemplateParameter , #installClass asPCGTemplateParameter) => [ :typeClass :installClass | (typeClass = installClass) asPCG ]) returnIt ];
						yourself.
	PCGProgramNode allSubclasses \ { PCGTemplateParameter. PCGCompositeTemplateParameter } do: [ :class |
		(template substituteParametersWith: {
			#typeClass -> class.
			#installClass -> class }) installOn: class.
		(template substituteParametersWith: {
			#typeClass -> class.
			#installClass -> PCGProgramNode }) installOn: PCGProgramNode. ]
]
