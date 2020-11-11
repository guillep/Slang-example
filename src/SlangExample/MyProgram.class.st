Class {
	#name : #MyProgram,
	#superclass : #ExtractedSuperclass,
	#category : #SlangExample
}

{ #category : #translation }
MyProgram class >> ancilliaryClasses [ 

	"Order is important! And Stack depends on StackElement"
	^ super ancilliaryClasses, { MyStackElement . MyStack }
]

{ #category : #accessing }
MyProgram >> main [
	<api> "To avoid making it static"
	<var: #stack type: 'MyStack*'>
	
	"So it gets correctly ignored.
	If we define it at the class level, this breaks slang"
	<var: #stdlib type: #implicit>
	<var: #stdio type: #implicit>
	
	| stack |
	stack := stdlib malloc: (self sizeof: MyStack).
	stack init.
	stack push: 7.
	stack push: 32.
	
	stdio printf: '%d\n' _: stack pop.
	stdio printf: '%d\n' _: stack pop.
	^ 1
]
