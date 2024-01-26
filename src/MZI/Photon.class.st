"
""A simple model of a photon.""
"
Class {
	#name : #Photon,
	#superclass : #Object,
	#instVars : [
		'state'
	],
	#category : #MZI
}

{ #category : #initialization }
Photon >> initialize [
	|contents|
	contents := Array with: (Complex real: 1 imaginary: 0) with: (Complex real: 0 imaginary: 0).
	state := Array2D rows: 2 columns: 1 contents: contents.

]

{ #category : #initialization }
Photon >> mirror [
	|contents transform|
	contents := Array with: (Complex real:0 imaginary: 0) with: (Complex real:1 imaginary: 0) with: (Complex real:1 imaginary: 0) with: (Complex real:0 imaginary: 0).
	transform := Array2D rows: 2 columns: 2 contents: contents.
	state := transform +* state.

]

{ #category : #initialization }
Photon >> state [
	^state

]
