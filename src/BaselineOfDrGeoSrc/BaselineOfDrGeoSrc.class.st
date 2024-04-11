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

{ #category : #loading }
BaselineOfDrGeoSrc class >> loadPackages [
	IceRepository registry
		detect: [ :aRepository | aRepository name = 'DrGeoSrc' ]
		ifFound: [ :aRepository | 
			(aRepository packages reject: #isLoaded) do: #load.
			^ aRepository ]
		ifNone: [ self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfDrGeoSrc >> baseline: spec [
	"NB: There are too many missing methods in the dummy classes to be able to load anything."

	<baseline>
	^ spec
		for: #common
		do: [ spec package: 'DrGeoSrc'	"spec package: 'DrGeo'.
			spec package: 'DrGeo-Factories'.
			spec package: 'DrGeo-File'.
			spec package: 'DrGeo-Missing'.
			spec package: 'DrGeo-Model'.
			spec package: 'DrGeo-Presenter'.
			spec package: 'DrGeo-System'.
			spec package: 'DrGeo-Test'.
			spec package: 'DrGeo-View'." ]
]
