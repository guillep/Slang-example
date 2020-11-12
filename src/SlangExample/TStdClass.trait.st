"
I am a helper stateful trait defining the #stdio and #stdlib variables
"
Trait {
	#name : #TStdClass,
	#instVars : [
		'stdio',
		'stdlib'
	],
	#category : #SlangExample
}

{ #category : #initialization }
TStdClass >> initialize [

	super initialize.
	stdio := SlStdio new.
	stdlib := SlStdlib new
]
