"
I'm an abstract example class defining the #stdio and #stdlib instance variables through a trait.
"
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
