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
	<var: #format type: 'const char *'>
	<returnTypeC: 'int'>
	^ (format printf: { argument }) size
]
