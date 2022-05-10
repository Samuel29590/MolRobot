Trait {
	#name : #MolMovementEvents,
	#traits : 'MolComponentEvents',
	#classTraits : 'MolComponentEvents classTrait',
	#category : #MolRobot
}

{ #category : #events }
MolMovementEvents >> goBackward [
	"Notify the Robot of a Backward movement."
]

{ #category : #events }
MolMovementEvents >> goForward [
	"Notify the Robot of a forward movement."
]

{ #category : #events }
MolMovementEvents >> turnLeft [
	"Notify the Robot of a turn."
]

{ #category : #events }
MolMovementEvents >> turnRight [
	"Notify the Robot of a turn."
]
