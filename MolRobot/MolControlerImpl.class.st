Class {
	#name : #MolControlerImpl,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'MolControler + MolForcesServices',
	#classTraits : 'MolControler classTrait + MolForcesServices classTrait',
	#instVars : [
		'angularForce',
		'linearForce',
		'sendEventsThread'
	],
	#category : #MolRobot
}

{ #category : #'life cycle' }
MolControlerImpl >> componentActivate [ 	
	"Start a thread to simulate input with the controler."
	| random x |
	random := Random new.
	
	sendEventsThread ifNil: [ 
		sendEventsThread := [ | compt |
			compt := 10000.
	 		[compt > 0] whileTrue:[ 
				(Delay forMilliseconds: 50) wait.
				x := random nextIntegerBetween: 1 and: 5 .
				linearForce := x.
				x := random nextIntegerBetween: 1 and: 2 .
				angularForce := x.
				x := random nextIntegerBetween: 1 and: 50 .
				((x=1)|(x=2)|(x=3)) ifTrue: [ self getMolMovementEventsNotifier turnLeft ].
				((x=4)|(x=5)|(x=6)) ifTrue: [ self getMolMovementEventsNotifier turnRight ].
				x = 6 ifTrue: [ self getMolMovementEventsNotifier goBackward ].
				x > 6 ifTrue: [ self getMolMovementEventsNotifier goForward ].
				compt := compt -1.
			].
		] forkAt: Processor userBackgroundPriority.
	sendEventsThread name: 'MolRobot : Controler implementation Process.'.
	].
	sendEventsThread resume.
]

{ #category : #'life cycle' }
MolControlerImpl >> componentInitialize [
	"Set starting variables: "
	
	linearForce := 0. 
	angularForce := 0. 
	sendEventsThread := nil. 
]

{ #category : #'life cycle' }
MolControlerImpl >> componentPassivate [ 
	"Clearing variables and terminating thread."
	
	linearForce := 0. 
	angularForce := 0. 
	sendEventsThread ifNotNil:[ :e | e terminate ].
	sendEventsThread := nil.
]

{ #category : #services }
MolControlerImpl >> getAngularForce [
	"Get and return the angular force of the left/right mouvement."
	
	^ angularForce
]

{ #category : #services }
MolControlerImpl >> getLinearForce [
	"Get and return the linear force of the forward/backward mouvement."
	
	^ linearForce
]

{ #category : #'component accessing' }
MolControlerImpl >> getMolMovementEventsNotifier [
	^self eventsNotifiers at: MolMovementEvents ifAbsent: [^MolNotFoundEventsNotifier new interface: MolMovementEvents name: nil].
]
