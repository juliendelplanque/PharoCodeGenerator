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
PCGMetaMetaCodeGeneratorTest >> testVisitAssignmentNode [
	| assignmentNode metaMetaAST |
	assignmentNode := #x asPCGTemporary assign: 1 asPCG.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: assignmentNode.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #assign:.
	self assert: metaMetaAST receiver class equals: PCGMessageNode.
	self assert: metaMetaAST receiver selector equals: #asPCGTemporary.
	self assert: metaMetaAST receiver receiver class equals: PCGLiteralValueNode.
	self assert: metaMetaAST receiver receiver value equals: #x.
	self assert: metaMetaAST receiver arguments isEmpty.
	self assert: metaMetaAST arguments size equals: 1.
	self assert: metaMetaAST arguments first class equals: PCGMessageNode.
	self assert: metaMetaAST arguments first selector equals: #asPCG.
	self assert: metaMetaAST arguments first receiver class equals: PCGLiteralValueNode.
	self assert: metaMetaAST arguments first receiver value equals: 1.
	self assert: metaMetaAST arguments first arguments isEmpty.
	
	self assert: metaMetaAST sourceCode equals: '#x asPCGTemporary assign: 1 asPCG'
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
PCGMetaMetaCodeGeneratorTest >> testVisitLiteralValueNode [
	| literalValueNode metaMetaAST |
	literalValueNode := 1 asPCG.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: literalValueNode.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #asPCG.
	self assert: metaMetaAST receiver class equals: PCGLiteralValueNode.
	self assert: metaMetaAST receiver value equals: 1.
	self assert: metaMetaAST arguments isEmpty.
	
	self assert: metaMetaAST sourceCode equals: '1 asPCG'
]

{ #category : #test }
PCGMetaMetaCodeGeneratorTest >> testVisitPragmaNode [
	| pragmaNode metaMetaAST |
	pragmaNode := PCGPragmaNode selector: #foo: arguments: { 1 asPCG }.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: pragmaNode.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #selector:arguments:.
	self assert: metaMetaAST receiver class equals: PCGGlobalNode.
	self assert: metaMetaAST receiver name equals: #PCGPragmaNode.
	self assert: metaMetaAST arguments size equals: 2.
	self assert: metaMetaAST arguments first class equals: PCGLiteralValueNode.
	self assert: metaMetaAST arguments first value equals: #foo:.
	self assert: metaMetaAST arguments second class equals: PCGArrayNode.
	self assert: metaMetaAST arguments second statements size equals: 1.
	self assert: metaMetaAST arguments second statements first class equals: PCGMessageNode.
	self assert: metaMetaAST arguments second statements first receiver class equals: PCGLiteralValueNode.
	self assert: metaMetaAST arguments second statements first receiver value equals: 1.
	self assert: metaMetaAST arguments second statements first selector equals: #asPCG.
	self assert: metaMetaAST arguments second statements first arguments isEmpty.
	
	self assert: metaMetaAST sourceCode equals: 'PCGPragmaNode selector: #foo: arguments: {1 asPCG}'
]

{ #category : #test }
PCGMetaMetaCodeGeneratorTest >> testVisitReturnNode [
	| returnNode metaMetaAST |
	returnNode := #self asPCGNode returnIt.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: returnNode.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #returnIt.
	self assert: metaMetaAST receiver class equals: PCGMessageNode.
	self assert: metaMetaAST receiver selector equals: #asPCGNode.
	self assert: metaMetaAST receiver receiver class equals: PCGLiteralValueNode.
	self assert: metaMetaAST receiver receiver value equals: #self.
	self assert: metaMetaAST receiver arguments isEmpty.
	self assert: metaMetaAST arguments isEmpty.
	
	self assert: metaMetaAST sourceCode equals: '#self asPCGNode returnIt'
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