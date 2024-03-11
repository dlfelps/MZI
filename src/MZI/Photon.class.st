"
""A simple model of a photon.""
"
Class {
	#name : #Photon,
	#superclass : #Object,
	#instVars : [
		'state',
		'log'
	],
	#category : #MZI
}

{ #category : #script }
Photon class >> runExperiment1 [

	| p |
	p := self new.
	p
		beamSplitter;
		blockLowerPath;
		mirror;
		beamSplitter;
		detector.
	Transcript clear.
	Transcript show: p log.
]

{ #category : #script }
Photon class >> runExperiment2a [

	| p |
	p := self new.
	p
		beamSplitter;
		mirror;
		beamSplitter;
		detector.
	Transcript clear.
	Transcript show: p log.
]

{ #category : #script }
Photon class >> runExperiment2b [

	| p |
	p := self new.
	p
		beamSplitter;
		mirror;
		detector.
	Transcript clear.
	Transcript show: p log.
]

{ #category : #script }
Photon class >> runExperiment2c [

	| p |
	p := self new.
	p
		beamSplitter;
		insertSecondBeamsplitter;
		mirror;
		beamSplitter;
		detector.
	Transcript clear.
	Transcript show: p log.
]

{ #category : #script }
Photon class >> runExperiment2d [

	| p |
	p := self new.
	p
		beamSplitter;
		skipSecondBeamsplitter;
		mirror;
		detector.
	Transcript clear.
	Transcript show: p log.
]

{ #category : #script }
Photon class >> runExperiment3a [

	| p |
	p := self new.
	p
		beamSplitter;
		defectiveEVBomb;
		mirror;
		beamSplitter;
		detector.
	Transcript clear.
	Transcript show: p log.
]

{ #category : #script }
Photon class >> runExperiment3b [

	| p |
	p := self new.
	p
		beamSplitter;
		workingEVBomb;
		mirror;
		beamSplitter;
		detector.
	Transcript clear.
	Transcript show: p log.
]

{ #category : #initialization }
Photon >> asProbabilities [
	|upper lower|
	upper := (state at: 1 at: 1) abs squared.
	lower := (state at: 2 at: 1) abs squared.
	^ Array with: upper with: lower.

]

{ #category : #initialization }
Photon >> beamSplitter [
	|contents transform|
	contents := Array with: (Complex real:1 imaginary: 0) with: (Complex real:0 imaginary: 1) with: (Complex real:0 imaginary: 1) with: (Complex real:1 imaginary: 0).
	transform := Array2D rows: 2 columns: 2 contents: (contents collect: [:each | each / (2 sqrt)]).
	state := transform +* state.
	log := log, 'Photon passing through a beam splitter. >> ', self asProbabilities printString, String cr.

]

{ #category : #initialization }
Photon >> blockLowerPath [
	state at: 2 at: 1 put: (Complex real:0 imaginary: 0). "block the lower path"
	log := log, 'Photon''s path blocked on lower path. >> ', self asProbabilities printString, String cr.

]

{ #category : #initialization }
Photon >> defectiveEVBomb [
	log := log, 'Photon passes through defective E-V Bomb placed on the lower path. >> ', self asProbabilities printString, String cr.

]

{ #category : #initialization }
Photon >> detector [
	log := log, 'Photon finally detected with following probabilities: >> ', self asProbabilities printString, String cr.

]

{ #category : #initialization }
Photon >> followLowerPath [
	state at: 1 at: 1 put: (Complex real:0 imaginary: 0). "block the upper path"

]

{ #category : #initialization }
Photon >> followUpperPath [
	state at: 2 at: 1 put: (Complex real:0 imaginary: 0). "block the lower path"

]

{ #category : #initialization }
Photon >> initialize [
	|contents|	
	contents := Array with: (Complex real: 0 imaginary: 0) with: (Complex real: 1 imaginary: 0).
	state := Array2D rows: 2 columns: 1 contents: contents.
	log := 'Emitting a photon from lower path. >> ', self asProbabilities printString, String cr.


]

{ #category : #initialization }
Photon >> insertSecondBeamsplitter [
	log := log, 'Second beamsplitter inserted into setup after mirror. ', String cr.

]

{ #category : #initialization }
Photon >> log [
	^log
]

{ #category : #initialization }
Photon >> mirror [
	|contents transform|
	contents := Array with: (Complex real:0 imaginary: 0) with: (Complex real:-1 imaginary: 0) with: (Complex real:-1 imaginary: 0) with: (Complex real:0 imaginary: 0).
	transform := Array2D rows: 2 columns: 2 contents: contents.
	state := transform +* state.
	log := log, 'Photon bouncing off of a mirror. >> ', self asProbabilities printString, String cr.

]

{ #category : #initialization }
Photon >> skipSecondBeamsplitter [
	log := log, 'Second beamsplitter omitted from setup. ', String cr.

]

{ #category : #initialization }
Photon >> state [
	^state

]

{ #category : #initialization }
Photon >> workingEVBomb [
	state at: 2 at: 1 put: (Complex real:0 imaginary: 0). "block the lower path"
	log := log, 'Photon detonates E-V Bomb on the lower path with 50% probability. >> ', self asProbabilities printString, String cr.

]
