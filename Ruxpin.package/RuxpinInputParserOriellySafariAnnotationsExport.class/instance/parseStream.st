parsing
parseStream
	| csvOutput |
	csvOutput := (NeoCSVReader on: inputStream) upToEnd .
	
	^ csvOutput collect: [ :inputLine | | n |
		n := RuxpinKnowledgeEntry new. 
		n title: (inputLine at: 1).
		n.
		 ].
	