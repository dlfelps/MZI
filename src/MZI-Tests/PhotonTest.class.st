Class {
	#name : #PhotonTest,
	#superclass : #TestCase,
	#instVars : [
		'p'
	],
	#category : #'MZI-Tests'
}

{ #category : #running }
PhotonTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	p := Photon new.
]

{ #category : #tests }
PhotonTest >> testMirror [
	|contents|
	contents := Array with: (Complex real: -1 imaginary: 0) with: (Complex real: 0 imaginary: 0).
	self assert: (p mirror) state privateContents equals: contents.
]

{ #category : #tests }
PhotonTest >> testPathSplitter [
	|currentState|
	currentState := p
							beamSplitter;
							followUpperPath;
							state.
							
		

]

{ #category : #tests }
PhotonTest >> testPhotonInit [
	|contents|
	contents := Array with: (Complex real: 0 imaginary: 0) with: (Complex real: 1 imaginary: 0).
	self assert: p state privateContents equals: contents.
]
