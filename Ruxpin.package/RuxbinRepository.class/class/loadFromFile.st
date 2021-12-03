as yet unclassified
loadFromFile
  	<script: 'self loadFromFile inspect'>
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| utils |
	utils := RuxpinUIUtils new.
	
	^ RuxbinRepository loadFromStream: (utils chooseFileAndMakeFileStream).