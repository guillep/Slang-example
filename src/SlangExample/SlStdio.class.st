"
I am a helper class showing off how external libraries can be defined:
 - defining a header
 - defining methods with <doNotGenerate>
"
Class {
	#name : #SlStdio,
	#superclass : #SlangClass,
	#category : #SlangExample
}

{ #category : #translation }
SlStdio class >> declareCVarsIn: aCCodeGenerator [

	aCCodeGenerator addHeaderFile: '<stdio.h>'
]

{ #category : #'as yet unclassified' }
SlStdio >> printf: format _: argument [

	<doNotGenerate>
	^ (format printf: { argument }) size
]
