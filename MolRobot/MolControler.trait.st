Trait {
	#name : #MolControler,
	#traits : 'MolComponentType',
	#classTraits : 'MolComponentType classTrait',
	#category : #MolRobot
}

{ #category : #'accessing - events' }
MolControler classSide >> producedComponentEvents [
	<componentContract>
	^ { MolMovementEvents } 
]

{ #category : #'accessing - services' }
MolControler classSide >> providedComponentServices [
	<componentContract>
	^ { MolForcesServices } 
]
