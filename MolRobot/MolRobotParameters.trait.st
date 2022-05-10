Trait {
	#name : #MolRobotParameters,
	#traits : 'MolComponentParameters',
	#classTraits : 'MolComponentParameters classTrait',
	#category : #MolRobot
}

{ #category : #initialization }
MolRobotParameters >> setDirection: anInteger [

	self explicitRequirement
]

{ #category : #initialization }
MolRobotParameters >> setPosition: aPoint [

	self explicitRequirement
]
