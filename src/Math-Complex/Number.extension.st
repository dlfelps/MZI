Extension { #name : #Number }

{ #category : #'*Math-Complex-converting' }
Number >> adaptToComplex: rcvr andSend: selector [
	"If I am involved in arithmetic with a Complex number, convert me to a Complex number."
	^ rcvr perform: selector with: self asComplex
]

{ #category : #'*Math-Complex-converting' }
Number >> asComplex [
	"Answer a Complex number that represents value of the the receiver."

	^ Complex real: self imaginary: 0
]

{ #category : #'*Math-Complex-converting' }
Number >> i [
	^ Complex real: 0 imaginary: self
]

{ #category : #'*Math-Complex-converting' }
Number >> i: aNumber [
	"Form a complex number with
		receiver as realPart
		aNumber as imaginaryPart
	this is the same as (self + aNumber i) but a little bit more efficient."

	aNumber isNumber ifFalse: [self error: 'Badly formed complex number'].
	^Complex real: self imaginary: aNumber
]
