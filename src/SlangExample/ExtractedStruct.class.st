"
I'm an abstract example struct defining the #stdio and #stdlib instance variables through a trait.
"
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
ExtractedStruct class >> filteredInstVarNames [
	
	^super filteredInstVarNames reject: [:n|
		TStdClass slotNames includes: n ]
]
