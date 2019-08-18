Class {
	#name : #PCGMeta,
	#superclass : #Object,
	#category : #'PharoCodeGenerator-Meta'
}

{ #category : #metaprogramming }
PCGMeta class >> runAllMetaprogrammingScripts [
	(PragmaCollector filter: [ :p | p selector = #metaprogramming ]) reset do: [ :p |
		p method selector value: p method methodClass instanceSide ]
]
