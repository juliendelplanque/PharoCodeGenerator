Class {
	#name : #PCGExtensionMethodsTest,
	#superclass : #TestCase,
	#category : #'PharoCodeGenerator-Tests-ExtensionMethods'
}

{ #category : #tests }
PCGExtensionMethodsTest >> testBooleanAsPCG [
	| truePCG falsePCG |
	truePCG := true asPCG.
	
	self assert: truePCG class equals: PCGLiteralValueNode.
	self assert: truePCG value equals: true.
	
	falsePCG := false asPCG.
	
	self assert: falsePCG class equals: PCGLiteralValueNode.
	self assert: falsePCG value equals: false
]

{ #category : #tests }
PCGExtensionMethodsTest >> testClassDescriptionAsPCG [
	| pcgAst |
	pcgAst := PCGFakeClass asPCG.
	self assert: pcgAst class equals: PCGGlobalNode.
	self assert: pcgAst name equals: 'PCGFakeClass'.
	
	pcgAst := PCGFakeClass class asPCG.
	self assert: pcgAst class equals: PCGMessageNode.
	self assert: pcgAst receiver class equals: PCGGlobalNode.
	self assert: pcgAst receiver name equals: 'PCGFakeClass'.
	self assert: pcgAst selector equals: #class.
	self assert: pcgAst arguments isEmpty.

	pcgAst := PCGFakeTrait asPCG.
	self assert: pcgAst class equals: PCGGlobalNode.
	self assert: pcgAst name equals: 'PCGFakeTrait'.
	
	pcgAst := PCGFakeTrait class asPCG.
	self assert: pcgAst class equals: PCGMessageNode.
	self assert: pcgAst receiver class equals: PCGGlobalNode.
	self assert: pcgAst receiver name equals: 'PCGFakeTrait'.
	self assert: pcgAst selector equals: #class.
	self assert: pcgAst arguments isEmpty.
]

{ #category : #tests }
PCGExtensionMethodsTest >> testNumberAsPCG [
	| numberPCG |
	numberPCG := 1 asPCG.
	self assert: numberPCG class equals: PCGLiteralValueNode.
	self assert: numberPCG value equals: 1.
	
	numberPCG := 1.5 asPCG.
	self assert: numberPCG class equals: PCGLiteralValueNode.
	self assert: numberPCG value equals: 1.5.
	
	numberPCG := 1.23s2 asPCG.
	self assert: numberPCG class equals: PCGLiteralValueNode.
	self assert: numberPCG value equals: 1.23s2.
	
	numberPCG := (1/2) asPCG.
	self assert: numberPCG class equals: PCGMessageNode.
	self assert: numberPCG receiver class equals: PCGLiteralValueNode.
	self assert: numberPCG receiver value equals: 1.
	self assert: numberPCG arguments size equals: 1.
	self assert: numberPCG arguments first class equals: PCGLiteralValueNode.
	self assert: numberPCG arguments first value equals: 2.
]

{ #category : #tests }
PCGExtensionMethodsTest >> testStringAsPCG [
	| stringPCG |
	stringPCG := 'hello' asPCG.
	
	self assert: stringPCG class equals: PCGLiteralValueNode.
	self assert: stringPCG value equals: 'hello'.
]

{ #category : #tests }
PCGExtensionMethodsTest >> testSymbolAsPCG [
	| symbol |
	symbol := #x asPCG.
	
	self assert: symbol class equals: PCGLiteralValueNode.
	self assert: symbol value equals: #x
]

{ #category : #tests }
PCGExtensionMethodsTest >> testSymbolAsPCGArgument [
	| argument |
	argument := #x asPCGArgument.
	
	self assert: argument class equals: PCGArgumentNode.
	self assert: argument name equals: #x
]

{ #category : #tests }
PCGExtensionMethodsTest >> testSymbolAsPCGGlobal [
	| global |
	global := #X asPCGGlobal.
	
	self assert: global class equals: PCGGlobalNode.
	self assert: global name equals: #X
]

{ #category : #tests }
PCGExtensionMethodsTest >> testSymbolAsPCGInstanceVariable [
	| instanceVariable |
	instanceVariable := #x asPCGInstanceVariable.
	
	self assert: instanceVariable class equals: PCGInstanceVariableNode.
	self assert: instanceVariable name equals: #x
]

{ #category : #tests }
PCGExtensionMethodsTest >> testSymbolAsPCGNode [
	self assert: #self asPCGNode equals: PCGSelfNode new.
	self assert: #super asPCGNode equals: PCGSuperNode new.
	self assert: #thisContext asPCGNode equals: PCGThisContextNode new.
]

{ #category : #tests }
PCGExtensionMethodsTest >> testSymbolAsPCGTemplateParameter [
	| templateParameter |
	templateParameter := #x asPCGTemplateParameter.
	
	self assert: templateParameter class equals: PCGTemplateParameter.
	self assert: templateParameter name equals: #x
]

{ #category : #tests }
PCGExtensionMethodsTest >> testSymbolAsPCGTemporary [
	| temporary |
	temporary := #x asPCGTemporary.
	
	self assert: temporary class equals: PCGTemporaryNode.
	self assert: temporary name equals: #x
]
