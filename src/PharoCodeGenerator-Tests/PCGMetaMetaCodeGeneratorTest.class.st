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
PCGMetaMetaCodeGeneratorTest >> testVisitArrayNode [
	| arrayNode metaMetaAST |
	arrayNode := { 1 asPCG. $a asPCG. 'foo' asPCG } asPCG.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: arrayNode.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #asPCG.
	self assert: metaMetaAST receiver class equals: PCGArrayNode.
	self assert: metaMetaAST receiver statements size equals: 3.
	
	self assert: metaMetaAST sourceCode equals: '{1 asPCG.
$a asPCG.
''foo'' asPCG} asPCG'
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
PCGMetaMetaCodeGeneratorTest >> testVisitBlockNode [
	| blockNode metaMetaAST |
	blockNode := (PCGBlockNode arguments: { #foo asPCGArgument })
						bodyBlock: [ :body |
							body << 'foo' asPCG.
							body << 42 asPCG ].
	
	metaMetaAST := PCGMetaMetaCodeGenerator visit: blockNode.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #bodyBlock:.
	self assert: metaMetaAST receiver class equals: PCGMessageNode.
	self assert: metaMetaAST receiver selector equals: #arguments:.
	self assert: metaMetaAST receiver arguments size equals: 1.
	self assert: metaMetaAST receiver arguments first class equals: PCGArrayNode.
	self assert: metaMetaAST arguments size equals: 1.
	self assert: metaMetaAST arguments first class equals: PCGBlockNode.
	self assert: metaMetaAST arguments first arguments size equals: 1.
	self assert: metaMetaAST arguments first statements size equals: 2.
	
	self assert: metaMetaAST sourceCode equals: '(PCGBlockNode arguments: {#foo asPCGArgument})
	bodyBlock: [ :body | 
		body << ''foo'' asPCG.
		body << 42 asPCG ]'
]

{ #category : #test }
PCGMetaMetaCodeGeneratorTest >> testVisitCascadeNode [
	| cascade metaMetaAST |
	cascade := 1 asPCG asCascadeTarget
					receiveMessage: #sqrt;
					receiveMessage: #asHexDigit.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: cascade.
	self assert: metaMetaAST class equals: PCGCascadeNode.
	self assert: metaMetaAST messages size equals: 2.
	self assert: metaMetaAST messages first class equals: PCGMessageNode.
	self assert: metaMetaAST messages first selector equals: #receiveMessage:.
	self assert: metaMetaAST messages first arguments size equals: 1.
	self assert: metaMetaAST messages second class equals: PCGMessageNode.
	self assert: metaMetaAST messages second selector equals: #receiveMessage:.
	self assert: metaMetaAST messages second arguments size equals: 1.
	self assert: metaMetaAST target class equals: PCGMessageNode.
	self assert: metaMetaAST target selector equals: #asCascadeTarget.
	
	self assert: metaMetaAST sourceCode equals: '1 asPCG asCascadeTarget
	receiveMessage: #sqrt;
	receiveMessage: #asHexDigit'
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
PCGMetaMetaCodeGeneratorTest >> testVisitLiteralArrayNode [
	| literalArrayNode metaMetaAST |
	literalArrayNode := PCGLiteralArrayNode contents: {1 asPCG. $a asPCG. 'foo' asPCG}.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: literalArrayNode.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #contents:.
	self assert: metaMetaAST receiver class equals: PCGGlobalNode.
	self assert: metaMetaAST receiver name equals: #PCGLiteralArrayNode.
	self assert: metaMetaAST arguments size equals: 1.
	self assert: metaMetaAST arguments first class equals: PCGArrayNode.
	self assert: metaMetaAST arguments first statements size equals: 3.
	
	self assert: metaMetaAST sourceCode equals: 'PCGLiteralArrayNode
	contents:
		{1 asPCG.
		$a asPCG.
		''foo'' asPCG}'
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
PCGMetaMetaCodeGeneratorTest >> testVisitMessageNode [
	| messageNode metaMetaAST |
	messageNode := 1 asPCG receiveMessage: #sqrt.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: messageNode.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #receiveMessage:.
	self assert: metaMetaAST receiver class equals: PCGMessageNode.
	self assert: metaMetaAST receiver selector equals: #asPCG.
	self assert: metaMetaAST arguments size equals: 1.
	self assert: metaMetaAST arguments first class equals: PCGLiteralValueNode.
	self assert: metaMetaAST arguments first value equals: #sqrt.
	
	self assert: metaMetaAST sourceCode equals: '1 asPCG receiveMessage: #sqrt'
]

{ #category : #test }
PCGMetaMetaCodeGeneratorTest >> testVisitMessageNode2 [
	| messageNode metaMetaAST |
	messageNode := 1 asPCG receiveMessage: #+ with: 1 asPCG.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: messageNode.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #receiveMessage:with:.
	self assert: metaMetaAST receiver class equals: PCGMessageNode.
	self assert: metaMetaAST receiver selector equals: #asPCG.
	self assert: metaMetaAST arguments size equals: 2.
	self assert: metaMetaAST arguments first class equals: PCGLiteralValueNode.
	self assert: metaMetaAST arguments first value equals: #+.
	self assert: metaMetaAST arguments second class equals: PCGMessageNode.
	self assert: metaMetaAST arguments second selector equals: #asPCG.
	
	self assert: metaMetaAST sourceCode equals: '1 asPCG receiveMessage: #+ with: 1 asPCG'
]

{ #category : #test }
PCGMetaMetaCodeGeneratorTest >> testVisitMessageNode3 [
	| messageNode metaMetaAST |
	messageNode := 1 asPCG receiveMessage: #foo:bar: with: 1 asPCG with: 1 asPCG.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: messageNode.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #receiveMessage:with:with:.
	self assert: metaMetaAST receiver class equals: PCGMessageNode.
	self assert: metaMetaAST receiver selector equals: #asPCG.
	self assert: metaMetaAST arguments size equals: 3.
	self assert: metaMetaAST arguments first class equals: PCGLiteralValueNode.
	self assert: metaMetaAST arguments first value equals: #foo:bar:.
	self assert: metaMetaAST arguments second class equals: PCGMessageNode.
	self assert: metaMetaAST arguments second selector equals: #asPCG.
	self assert: metaMetaAST arguments third class equals: PCGMessageNode.
	self assert: metaMetaAST arguments third selector equals: #asPCG.
	
	self assert: metaMetaAST sourceCode equals: '1 asPCG receiveMessage: #foo:bar: with: 1 asPCG with: 1 asPCG'
]

{ #category : #test }
PCGMetaMetaCodeGeneratorTest >> testVisitMessageNode4 [
	| messageNode metaMetaAST |
	messageNode := 1 asPCG receiveMessage: #foo:bar:foo: with: 1 asPCG with: 1 asPCG with: 1 asPCG.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: messageNode.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #receiveMessage:with:with:with:.
	self assert: metaMetaAST receiver class equals: PCGMessageNode.
	self assert: metaMetaAST receiver selector equals: #asPCG.
	self assert: metaMetaAST arguments size equals: 4.
	self assert: metaMetaAST arguments first class equals: PCGLiteralValueNode.
	self assert: metaMetaAST arguments first value equals: #foo:bar:foo:.
	self assert: metaMetaAST arguments second class equals: PCGMessageNode.
	self assert: metaMetaAST arguments second selector equals: #asPCG.
	self assert: metaMetaAST arguments third class equals: PCGMessageNode.
	self assert: metaMetaAST arguments third selector equals: #asPCG.
	self assert: metaMetaAST arguments fourth class equals: PCGMessageNode.
	self assert: metaMetaAST arguments fourth selector equals: #asPCG.
	
	self assert: metaMetaAST sourceCode equals: '1 asPCG
	receiveMessage: #foo:bar:foo:
	with: 1 asPCG
	with: 1 asPCG
	with: 1 asPCG'
]

{ #category : #test }
PCGMetaMetaCodeGeneratorTest >> testVisitMessageNode5 [
	| messageNode metaMetaAST |
	messageNode := 1 asPCG receiveMessage: #foo:bar:foo:bar: withAll: {1 asPCG. 1 asPCG. 1 asPCG. 1 asPCG}.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: messageNode.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #receiveMessage:withAll:.
	self assert: metaMetaAST receiver class equals: PCGMessageNode.
	self assert: metaMetaAST receiver selector equals: #asPCG.
	self assert: metaMetaAST arguments size equals: 2.
	self assert: metaMetaAST arguments first class equals: PCGLiteralValueNode.
	self assert: metaMetaAST arguments first value equals: #foo:bar:foo:bar:.
	self assert: metaMetaAST arguments second class equals: PCGArrayNode.
	self assert: metaMetaAST arguments second statements size equals: 4.
	
	self assert: metaMetaAST sourceCode equals: '1 asPCG
	receiveMessage: #foo:bar:foo:bar:
	withAll:
		{1 asPCG.
		1 asPCG.
		1 asPCG.
		1 asPCG}'
]

{ #category : #test }
PCGMetaMetaCodeGeneratorTest >> testVisitMethodNode [
	| methodNode metaMetaAST |
	methodNode := (PCGMethodNode selector: #foo: arguments: { #x asPCGArgument })
						addPragmaNamed: #fooPrag;
						bodyBlock: [ :body |
							body << 42 asPCG returnIt ];
						protocol: #'my-protocol'.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: methodNode.
	self assert: metaMetaAST class equals: PCGCascadeNode.
	self assert: metaMetaAST target class equals: PCGMessageNode.
	self assert: metaMetaAST target selector equals: #selector:arguments:.
	self assert: metaMetaAST target receiver class equals: PCGGlobalNode.
	self assert: metaMetaAST target receiver name equals: #PCGMethodNode.
	self assert: metaMetaAST target arguments size equals: 2.
	self assert: metaMetaAST target arguments first class equals: PCGLiteralValueNode.
	self assert: metaMetaAST target arguments first value equals: #foo:.
	self assert: metaMetaAST target arguments second class equals: PCGArrayNode.
	self assert: metaMetaAST messages size equals: 5.
	self assert: metaMetaAST messages first selector equals: #addPragma:.
	self assert: metaMetaAST messages second selector equals: #addPragma:.
	self assert: metaMetaAST messages third selector equals: #bodyBlock:.
	self assert: metaMetaAST messages fourth selector equals: #protocol:.
	self assert: metaMetaAST messages fifth selector equals: #yourself.
	
	self assert: metaMetaAST sourceCode equals: '(PCGMethodNode selector: #foo: arguments: {#x asPCGArgument})
	addPragma: (PCGPragmaNode selector: #generated arguments: {});
	addPragma: (PCGPragmaNode selector: #fooPrag arguments: {});
	bodyBlock: [ :body | body << 42 asPCG returnIt ];
	protocol: #''my-protocol'';
	yourself'
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
PCGMetaMetaCodeGeneratorTest >> testVisitSequenceNode [
	| statementNode metaMetaAST |
	statementNode := PCGSequenceNode temporaries: { #foo asPCGTemporary } statements: { 1 asPCG. $a asPCG. 'foo' asPCG }.

	metaMetaAST := PCGMetaMetaCodeGenerator visit: statementNode.
	self assert: metaMetaAST class equals: PCGMessageNode.
	self assert: metaMetaAST selector equals: #temporaries:statements:.
	self assert: metaMetaAST receiver class equals: PCGGlobalNode.
	self assert: metaMetaAST receiver name equals: #PCGSequenceNode.
	self assert: metaMetaAST arguments size equals: 2.
	self assert: metaMetaAST arguments first class equals: PCGArrayNode.
	self assert: metaMetaAST arguments first statements size equals: 1.
	self assert: metaMetaAST arguments second class equals: PCGArrayNode.
	self assert: metaMetaAST arguments second statements size equals: 3.
	
	self assert: metaMetaAST sourceCode equals: 'PCGSequenceNode
	temporaries: {#foo asPCGTemporary}
	statements:
		{1 asPCG.
		$a asPCG.
		''foo'' asPCG}'
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
