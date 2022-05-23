Class {
	#name : #MolRobotImpl,
	#superclass : #BlElement,
	#traits : 'MolComponentImpl + MolRobot + MolMovementEvents + MolRobotParameters',
	#classTraits : 'MolComponentImpl classTrait + MolRobot classTrait + MolMovementEvents classTrait + MolRobotParameters classTrait',
	#instVars : [
		'position',
		'direction',
		'mySpace'
	],
	#classInstVars : [
		'position'
	],
	#category : #MolRobot
}

{ #category : #'life cycle' }
MolRobotImpl >> componentActivate [
	
	self getMolMovementEventsSubscriber subscribe: self.
]

{ #category : #'life cycle' }
MolRobotImpl >> componentInitialize [
	"Set starting variables: "
	
	position := 0@0.
	direction := 0.
	mySpace := self openInNewSpace extent:510@510.
	self geometry: BlTriangleGeometry new.
	self geometry beTop.
	self background: Color black.
	self size: 20@20.
	self relocate: position.
]

{ #category : #'life cycle' }
MolRobotImpl >> componentPassivate [
	"here write the code corresponding to component passivation phase"
	
	self getMolMovementEventsSubscriber unsubscribe: self.
]

{ #category : #'life cycle' }
MolRobotImpl >> componentRemove [
	"here write the code corresponding to component remove phase"
	
	mySpace close.
]

{ #category : #'component accessing' }
MolRobotImpl >> getMolForcesServicesProvider [
	| servicesSymbol servicesProvider itf |
	itf := MolForcesServices.
	servicesSymbol := self servicesProviders at: itf ifAbsent: [^MolNotFoundServicesProvider new interface: itf name: nil].
	servicesSymbol isSymbol
	 	ifTrue: 
			[servicesProvider := MolComponentManager default locatorServices 
						searchServicesProviderFor: MolForcesServices named: servicesSymbol]. 
	^servicesProvider
]

{ #category : #'component accessing' }
MolRobotImpl >> getMolMovementEventsSubscriber [
	| eventsSymbol eventsSubscriber itf |
	itf := MolMovementEvents.
	eventsSymbol := self eventsSubscribers at: itf ifAbsent: [^MolNotFoundEventsSubscriber new interface: itf name: nil].
	eventsSymbol isCollection
	 	ifTrue: 
			[eventsSubscriber := MolComponentManager default locatorServices 
						searchEventsSubscriberFor: MolMovementEvents named: eventsSymbol ]. 
	^eventsSubscriber
]

{ #category : #events }
MolRobotImpl >> goBackward [
	"Notify the Robot of a Backward movement."
	
	| linearForce |
	
	linearForce := self getMolForcesServicesProvider getLinearForce.
	
	(direction = 0) ifTrue: [ (position y <= 5) ifFalse:[ position := position + (0@linearForce) ]].
	(direction = 1) ifTrue: [ (position x >= 495) ifFalse:[ position := position - (linearForce@0) ]].
	(direction = 2) ifTrue: [ (position y >= 495) ifFalse:[ position := position - (0@linearForce) ]].
	(direction = 3) ifTrue: [ (position x <= 5) ifFalse:[ position := position + (linearForce@0) ]].
	
	self reDraw.
]

{ #category : #events }
MolRobotImpl >> goForward [
	"Notify the Robot of a forward movement."
	
	| linearForce |
	
	linearForce := self getMolForcesServicesProvider getLinearForce.
	
	(direction = 0) ifTrue: [ (position y <= 5) ifFalse:[ position := position - (0@linearForce) ]].
	(direction = 1) ifTrue: [ (position x >= 495) ifFalse:[ position := position + (linearForce@0) ]].
	(direction = 2) ifTrue: [ (position y >= 495) ifFalse:[ position := position + (0@linearForce) ]].
	(direction = 3) ifTrue: [ (position x <= 5) ifFalse:[ position := position - (linearForce@0) ]].
	
	self reDraw.
]

{ #category : #drawing }
MolRobotImpl >> reDraw [

	(direction = 0) ifTrue: [ self geometry beTop.  ].
	(direction = 1) ifTrue: [ self geometry beRight. ].
	(direction = 2) ifTrue: [ self geometry beBottom. ].
	(direction = 3) ifTrue: [ self geometry beLeft. ].
	
	self relocate: position.

	Transcript show: ('[Robot] Direction: ', direction rounded printString, ' Position: ', position rounded printString); cr.
]

{ #category : #parameters }
MolRobotImpl >> setDirection: anInteger [

	direction := anInteger.
	
	Transcript show: ('[Robot] Direction initialized: ', direction rounded printString); cr.
	
	self reDraw.
]

{ #category : #parameters }
MolRobotImpl >> setPosition: aPoint [

	position := aPoint.
	
	Transcript show: ('[Robot] Position initialized: ', position rounded printString); cr.
	
	self reDraw.
]

{ #category : #events }
MolRobotImpl >> turnLeft [
	"Notify the Robot of a turn."
	
	| angularForce|
	
	angularForce := self getMolForcesServicesProvider getAngularForce.
	
	direction := direction - angularForce.
	
	(direction>3) ifTrue: [ 	direction := direction - 4 ].
	(direction<0) ifTrue: [ 	direction := direction + 4 ].
	
	self reDraw.
]

{ #category : #events }
MolRobotImpl >> turnRight [
	"Notify the Robot of a turn."
	
	| angularForce|
	
	angularForce := self getMolForcesServicesProvider getAngularForce.
	
	direction := direction+angularForce.
	
	(direction>3) ifTrue: [ direction := direction - 4 ].
	(direction<0) ifTrue: [ direction := direction + 4 ].
	
	self reDraw.
]
