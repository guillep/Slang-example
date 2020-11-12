"
I am the main entry point of the slang example. I show off:
 - compile time options
 - generation time options
 - typing: variable types, argument types, return types, default types
 - definition of headers and conditional headers
 - selector mangling
"
Class {
	#name : #MyProgram,
	#superclass : #ExtractedSuperclass,
	#classVars : [
		'GENERATION_TIME_PRINT_TWICE'
	],
	#category : #SlangExample
}

{ #category : #translation }
MyProgram class >> ancilliaryClasses [ 

	"Order is important! And Stack depends on StackElement"
	^ super ancilliaryClasses, { MyStackElement . MyStack }
]

{ #category : #configuration }
MyProgram class >> declareCVarsIn: aCCodeGenerator [

	"Example of compile time conditional header"

	"A header in quoted form works like this."	
	aCCodeGenerator addHeaderFile: '#if CONDITIONAL_HEADER'.
	aCCodeGenerator addHeaderFile: '"conditional_header.h"'.
	aCCodeGenerator addHeaderFile: '#endif //CONDITIONAL_HEADER'.
	
	"A header in angle-bracket form needs to be specified in a single string.
	Otherwise slang sorts headers and removes it from the conditional definition."
	aCCodeGenerator addHeaderFile: '#if CONDITIONAL_HEADER
#include <conditional_header.h>
#endif //CONDITIONAL_HEADER'.
]

{ #category : #'api-translation' }
MyProgram class >> exportTo: aFileReference [

	| programClasses cg translationClasses structClasses |
	"This is the main Slang API to translate a program from a class.
	It 
	  - takes all the ancilliary classes from this one, separating structs from non structs
	  - create a code generator from them
	  - run type inference
	  - output the translated program to the desired file"
	
	self generationPrintTwice: false.
	programClasses := { self }.

	cg := CCodeGenerator new.
	cg compileTimeOptions: { #COMPLEX_FORMAT }.

	translationClasses := programClasses, (cg nonStructClassesForTranslationClasses: programClasses).
	structClasses := cg structClassesForTranslationClasses: programClasses.

	cg addStructClasses: structClasses.
	translationClasses do: [ :ic | cg addClass: ic.  ].

	cg inferTypesForImplicitlyTypedVariablesAndMethods.

	cg storeCodeOnFile: aFileReference doInlining: false.
]

{ #category : #configuration }
MyProgram class >> generationPrintTwice: aBoolean [ 
	
	GENERATION_TIME_PRINT_TWICE := aBoolean
]

{ #category : #accessing }
MyProgram >> complexFormat [
	<inline: false>
	<option: #COMPILE_TIME_COMPLEX_FORMAT>
	<returnTypeC: 'char*'>
	^ 'Pop: %d\n'
]

{ #category : #accessing }
MyProgram >> main [
	<api> "To avoid making it static"
	<var: #stack type: 'MyStack*'>
	<var: #format type: 'char*'>
	
	"So it gets correctly ignored.
	If we define it at the class level, this breaks slang"
	<var: #stdlib type: #implicit>
	<var: #stdio type: #implicit>
	
	| stack format |
	stack := stdlib malloc: (self sizeof: MyStack).
	stack init.
	stack push: 7.
	stack push: 32.
	
	"Example of a compile-time option"
	self
		cppIf: #COMPILE_TIME_COMPLEX_FORMAT
		ifTrue: [ format := self complexFormat ]
		ifFalse: [ format := '%d\n' ].
	
	self
		cppIf: GENERATION_TIME_PRINT_TWICE
		ifTrue: [ self printTwice: stack pop format: format ]
		ifFalse: [ stdio printf: format _: stack pop. ].
	stdio printf: format _: stack pop.
	^ 1
]

{ #category : #accessing }
MyProgram >> printTwice: aValue format: aFormat [
	<inline: false>
	<option: #GENERATION_TIME_PRINT_TWICE>
	<var: #aFormat type: 'char*'>
	
	"So it gets correctly ignored.
	If we define it at the class level, this breaks slang"
	<var: #stdio type: #implicit>

	stdio printf: aFormat _: aValue
]
