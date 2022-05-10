Trait {
	#name : #MolRobot,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #MolRobot
}

{ #category : #'accessing - events' }
MolRobot classSide >> consumedComponentEvents [
	<componentContract>
	^ { MolMovementEvents }
]

{ #category : #'accessing - parameters' }
MolRobot classSide >> providedComponentParameters [
	<componentContract>
	^ { MolRobotParameters } 
]

{ #category : #'accessing - parameters' }
MolRobot classSide >> usedComponentParameters [
	<componentContract>
	^ {} 
]

{ #category : #'accessing - services' }
MolRobot classSide >> usedComponentServices [
	<componentContract>
	^ { MolForcesServices }
]
