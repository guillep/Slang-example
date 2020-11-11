Class {
	#name : #ExtractedSuperclass,
	#superclass : #SlangClass,
	#traits : 'TStdClass',
	#category : #SlangExample
}

{ #category : #translation }
ExtractedSuperclass class >> ancilliaryClasses [

	^ { SlStdlib . SlStdio }
]

{ #category : #translation }
ExtractedSuperclass class >> declareCVarsIn: aCCodeGenerator [

	super declareCVarsIn: aCCodeGenerator.
"	aCCodeGenerator declareVar: 'stdio' type: #implicit.
	aCCodeGenerator declareVar: 'stdlib' type: #implicit"
]

{ #category : #initialization }
ExtractedSuperclass >> initialize [

	super initialize.
	stdio := SlStdio new.
	stdlib := SlStdlib new
]
