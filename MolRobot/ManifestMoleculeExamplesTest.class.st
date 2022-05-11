"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMoleculeExamplesTest,
	#superclass : #PackageManifest,
	#category : #MolRobot
}

{ #category : #'code-critics' }
ManifestMoleculeExamplesTest class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'MolRobotExampleLauncher class' #start #true)) #'2022-05-06T10:02:35.8737+01:00') )
]

{ #category : #'code-critics' }
ManifestMoleculeExamplesTest class >> ruleLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MolControlerImpl #componentActivate #false)) #'2022-05-06T09:33:14.117916+01:00') )
]

{ #category : #'code-critics' }
ManifestMoleculeExamplesTest class >> ruleSearchingLiteralRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MolControlerImpl #componentActivate #false)) #'2022-05-11T15:14:19.270688+01:00') )
]

{ #category : #'code-critics' }
ManifestMoleculeExamplesTest class >> ruleThemeAPIUpdateRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'MolRobotExampleLauncher class' #start #true)) #'2022-05-06T10:02:26.578312+01:00') )
]

{ #category : #'code-critics' }
ManifestMoleculeExamplesTest class >> ruleWhileTrueRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MolControlerImpl #componentActivate #false)) #'2022-05-05T21:39:20.274956+01:00') )
]
