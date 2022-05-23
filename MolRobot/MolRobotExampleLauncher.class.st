Class {
	#name : #MolRobotExampleLauncher,
	#superclass : #Object,
	#classInstVars : [
		'myTranscript'
	],
	#category : #MolRobot
}

{ #category : #scripts }
MolRobotExampleLauncher class >> pause [
	<script: 'self pause'>
	"Pause the simulation"
	
	MolControlerImpl passivate.
	MolRobotImpl  passivate.
]

{ #category : #scripts }
MolRobotExampleLauncher class >> play [
	<script: 'self play'>
	"Pause the simulation"
	
	MolControlerImpl activate.
	MolRobotImpl  activate .
]

{ #category : #scripts }
MolRobotExampleLauncher class >> start [
	<script: 'self start'>
	| robotParameters |
	
	(UITheme current
		proceedIn: Morph new 
		text: 'This example displays results in a Transcript, clic OK to open a Transcript.'
		title: 'Molecule - GPS Example') ifTrue:[myTranscript := Transcript open].
	
	MolComponentManager cleanUp.
	
	"Start ControleImpl component (a Component with MolControler Type)"
	MolControlerImpl start.
	
	"Start RobotImpl component (a Component with MolRobot Type)"
	MolRobotImpl start.
	robotParameters := MolComponentManager default locatorServices searchParametersProviderFor: MolRobotParameters.
	robotParameters setPosition: 150@100.
	robotParameters setDirection: 2.
]

{ #category : #scripts }
MolRobotExampleLauncher class >> stop [
	<script: 'self stop'>
	"General stop : Cleanup the Component Manager"
	
	myTranscript close.
	MolComponentManager cleanUp
]
