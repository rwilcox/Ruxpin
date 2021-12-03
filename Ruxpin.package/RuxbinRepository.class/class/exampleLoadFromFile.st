examples
exampleLoadFromFile

	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| utils |
	utils := RuxpinUIUtils new.
	
	utils sendRepoToPlayground: (RuxbinRepository loadFromStream: (utils chooseFileAndMakeFileStream)).