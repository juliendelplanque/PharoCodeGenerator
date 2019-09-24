"
I model the absence of a node. I am the implementation of the null object design pattern.
I am used for nodes that do not have a parent.
"
Class {
	#name : #PCGNullNode,
	#superclass : #Object,
	#category : #'PharoCodeGenerator-AST'
}

{ #category : #testing }
PCGNullNode >> isArgument [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isArray [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isAssignment [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isBlock [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isCascade [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isGlobal [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isInstanceVariable [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isLiteral [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isLiteralArray [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isLiteralValue [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isMessage [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isMethod [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isNull [
	^ true
]

{ #category : #testing }
PCGNullNode >> isPragma [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isReturn [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isSelf [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isSequence [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isSuper [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isTemporary [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isThisContext [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isValue [
	<generated>
	^ false
]

{ #category : #testing }
PCGNullNode >> isVariable [
	<generated>
	^ false
]
