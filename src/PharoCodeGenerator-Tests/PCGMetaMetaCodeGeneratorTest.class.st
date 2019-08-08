"
A PCGMetaMetaCodeGeneratorTest is a test class for testing the behavior of PCGMetaMetaCodeGenerator
"
Class {
	#name : #PCGMetaMetaCodeGeneratorTest,
	#superclass : #TestCase,
	#category : #'PharoCodeGenerator-Tests-Visitors'
}

{ #category : #test }
PCGMetaMetaCodeGeneratorTest >> testVisitArgumentNode [
	| argument metaMetaAST |
	argument := #hello asPCGArgument.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: argument.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #asPCGArgument.
	self assert: metaMetaAST receiver class equals: PCGLiteralValueNode.
	self assert: metaMetaAST receiver value equals: #hello.
	self assert: metaMetaAST arguments isEmpty.
	
	self assert: metaMetaAST sourceCode equals: '#hello asPCGArgument'
]

{ #category : #test }
PCGMetaMetaCodeGeneratorTest >> testVisitGlobalNode [
	| global metaMetaAST |
	global := #Foo asPCGGlobal.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: global.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #asPCGGlobal.
	self assert: metaMetaAST receiver class equals: PCGLiteralValueNode.
	self assert: metaMetaAST receiver value equals: #Foo.
	self assert: metaMetaAST arguments isEmpty.
	
	self assert: metaMetaAST sourceCode equals: '#Foo asPCGGlobal'
]

{ #category : #test }
PCGMetaMetaCodeGeneratorTest >> testVisitInstanceVariableNode [
	| instanceVariable metaMetaAST |
	instanceVariable := #hello asPCGInstanceVariable.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: instanceVariable.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #asPCGInstanceVariable.
	self assert: metaMetaAST receiver class equals: PCGLiteralValueNode.
	self assert: metaMetaAST receiver value equals: #hello.
	self assert: metaMetaAST arguments isEmpty.
	
	self assert: metaMetaAST sourceCode equals: '#hello asPCGInstanceVariable'
]

{ #category : #test }
PCGMetaMetaCodeGeneratorTest >> testVisitSelfNode [
	| selfNode metaMetaAST |
	selfNode := #self asPCGNode.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: selfNode.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #asPCGNode.
	self assert: metaMetaAST receiver class equals: PCGLiteralValueNode.
	self assert: metaMetaAST receiver value equals: #self.
	self assert: metaMetaAST arguments isEmpty.
	
	self assert: metaMetaAST sourceCode equals: '#self asPCGNode'
]

{ #category : #test }
PCGMetaMetaCodeGeneratorTest >> testVisitSuperNode [
	| superNode metaMetaAST |
	superNode := #super asPCGNode.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: superNode.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #asPCGNode.
	self assert: metaMetaAST receiver class equals: PCGLiteralValueNode.
	self assert: metaMetaAST receiver value equals: #super.
	self assert: metaMetaAST arguments isEmpty.
	
	self assert: metaMetaAST sourceCode equals: '#super asPCGNode'
]

{ #category : #test }
PCGMetaMetaCodeGeneratorTest >> testVisitTemplateParameter [
	| templateParameter metaMetaAST |
	templateParameter := #hello asPCGTemplateParameter.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: templateParameter.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #asPCGTemplateParameter.
	self assert: metaMetaAST receiver class equals: PCGLiteralValueNode.
	self assert: metaMetaAST receiver value equals: #hello.
	self assert: metaMetaAST arguments isEmpty.
	
	self assert: metaMetaAST sourceCode equals: '#hello asPCGTemplateParameter'
]

{ #category : #test }
PCGMetaMetaCodeGeneratorTest >> testVisitTemporaryNode [
	| temporary metaMetaAST |
	temporary := #hello asPCGTemporary.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: temporary.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #asPCGTemporary.
	self assert: metaMetaAST receiver class equals: PCGLiteralValueNode.
	self assert: metaMetaAST receiver value equals: #hello.
	self assert: metaMetaAST arguments isEmpty.
	
	self assert: metaMetaAST sourceCode equals: '#hello asPCGTemporary'
]

{ #category : #test }
PCGMetaMetaCodeGeneratorTest >> testVisitThisContextNode [
	| thisContextNode metaMetaAST |
	thisContextNode := #thisContext asPCGNode.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: thisContextNode.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #asPCGNode.
	self assert: metaMetaAST receiver class equals: PCGLiteralValueNode.
	self assert: metaMetaAST receiver value equals: #thisContext.
	self assert: metaMetaAST arguments isEmpty.
	
	self assert: metaMetaAST sourceCode equals: '#thisContext asPCGNode'
]
