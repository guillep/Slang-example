"
I am an example struct showing how a recursive struct is defined (a stack element can reference another stack element).
"
Class {
	#name : #MyStackElement,
	#superclass : #ExtractedStruct,
	#instVars : [
		'stackValue',
		'next'
	],
	#category : #SlangExample
}

{ #category : #enumerating }
MyStackElement class >> instVarNamesAndTypesForTranslationDo: aBinaryBlock [ 

	self filteredInstVarNames do:
		[:ivn|
		aBinaryBlock
			value: ivn
			value: (ivn caseOf: {
						['stackValue']		-> [#'int'].
						['next']		-> ['struct ', MyStackElement structTagName , '*'].
				} otherwise: [ self halt ])]
]

{ #category : #accessing }
MyStackElement >> next [
	^ next
]

{ #category : #accessing }
MyStackElement >> next: anObject [
	next := anObject
]

{ #category : #accessing }
MyStackElement >> stackValue [
	^ stackValue
]

{ #category : #accessing }
MyStackElement >> stackValue: anObject [
	stackValue := anObject
]
