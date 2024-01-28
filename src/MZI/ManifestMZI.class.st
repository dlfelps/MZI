"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMZI,
	#superclass : #PackageManifest,
	#category : #'MZI-Manifest'
}

{ #category : #'code-critics' }
ManifestMZI class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#MZI)) #'2024-01-28T06:19:08.115-05:00') )
]
