Class {
	#name : #ExtractedStruct,
	#superclass : #SlangStructType,
	#traits : 'TStdClass',
	#category : #SlangExample
}

{ #category : #accessing }
ExtractedStruct class >> baseStructClass [

	^ ExtractedStruct
]

{ #category : #translation }
ExtractedStruct class >> declareCVarsIn: aCCodeGenerator [

	super declareCVarsIn: aCCodeGenerator.
"	aCCodeGenerator declareVar: 'stdio' type: #implicit.
	aCCodeGenerator declareVar: 'stdlib' type: #implicit"
]

{ #category : #translation }
ExtractedStruct class >> filteredInstVarNames [
	
	^super filteredInstVarNames reject: [:n|
		TStdClass slotNames includes: n ]
]
