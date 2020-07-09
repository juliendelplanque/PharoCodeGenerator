"
A PCGASTCheckerTest is a test class for testing the behavior of PCGASTChecker
"
Class {
	#name : #PCGASTCheckerTest,
	#superclass : #PCGTestCase,
	#instVars : [
		'astChecker'
	],
	#category : #'PharoCodeGenerator-Tests-Visitors'
}

{ #category : #running }
PCGASTCheckerTest >> setUp [
	super setUp.
	astChecker := PCGASTChecker new
]

{ #category : #test }
PCGASTCheckerTest >> testCheckMethodOrMessageNode [
	| invalidMessageSend |
	invalidMessageSend := 0 asPCG receiveMessage: #invalid with: 1 asPCG.
	self should: [ astChecker visit: invalidMessageSend ] raise: PCGASTInvalidForTranslation
]

{ #category : #test }
PCGASTCheckerTest >> testCheckMethodOrMessageNode2 [
	| invalidMessageSendInMethod |
	invalidMessageSendInMethod := (PCGMethodNode selector: #x)
												bodyBlock: [ :body |
													body << (32 asPCG receiveMessage: #foo with: 2 asPCG) ].
	
	
	self should: [ astChecker visit: invalidMessageSendInMethod ] raise: PCGASTInvalidForTranslation
]
