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
