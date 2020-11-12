"
I am a helper class showing off how external libraries can be defined:
 - defining a header
 - defining methods with <doNotGenerate>
"
Class {
	#name : #SlStdlib,
	#superclass : #SlangClass,
	#category : #SlangExample
}

{ #category : #translation }
SlStdlib class >> declareCVarsIn: aCCodeGenerator [

	aCCodeGenerator addHeaderFile: '<stdlib.h>'
]

{ #category : #initialization }
SlStdlib >> malloc: size [

	<doNotGenerate>
	<var: #size type: 'size_t'>
	<returnTypeC: 'void*'>
	"void * malloc(size_t size);"
]
