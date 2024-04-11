Class {
	#name : #BaselineOfDrGeoSrc,
	#superclass : #BaselineOf,
	#category : #BaselineOfDrGeoSrc
}

{ #category : #loading }
BaselineOfDrGeoSrc class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'DrGeoSrc' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfDrGeoSrc >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'DrGeoSrc'
		]
]
