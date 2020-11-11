Class {
	#name : #MyStack,
	#superclass : #ExtractedStruct,
	#instVars : [
		'first'
	],
	#category : #SlangExample
}

{ #category : #enumerating }
MyStack class >> instVarNamesAndTypesForTranslationDo: aBinaryBlock [ 

	self filteredInstVarNames do:
		[:ivn|
		aBinaryBlock
			value: ivn
			value: (ivn caseOf: {
						['first']		-> [ 'MyStackElement*' ].
				} otherwise: [ self halt ])]
]

{ #category : #adding }
MyStack >> first [

	^ first
]

{ #category : #adding }
MyStack >> init [

	first := nil
]

{ #category : #adding }
MyStack >> pop [
	<var: #stackElement type: 'MyStackElement *'>
	| stackElement |
	stackElement := first.
	first := first next.
	^ stackElement stackValue
]

{ #category : #adding }
MyStack >> push: aValue [
	<var: #stackElement type: 'MyStackElement *'>
	
	"So it gets correctly ignored.
	If we define it at the class level, this breaks slang"
	<var: #stdlib type: #implicit>
	
	| stackElement |
	stackElement := stdlib malloc: (self sizeof: MyStackElement).
	stackElement stackValue: aValue.
	stackElement next: first.
	first := stackElement
]
