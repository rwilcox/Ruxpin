parsing
parseStream
	| csvOutput|
	csvOutput := (NeoCSVReader on: inputStream) upToEnd .
	
	^ (csvOutput allButFirst) collect: [ :inputLine | | n txt kind|
		
		n := RuxpinKnowledgeEntry new. 
		n title: (inputLine at: 1);
		author: (inputLine at: 2);
		chapterTitle: (inputLine at: 3);
		url: (inputLine at: 5);
		referenceLocation: (inputLine at: 7);
		"Safari only gives us a URL to the location, not page number or even byte or whatever"
		
		date: (self parseStringToDate: (inputLine at: 4)).
		
		(inputLine at: 9) ifNotNil: [ kind := 'note'. txt := (inputLine at: 9). ] ifNil: [ kind := 'highlite'. txt := (inputLine at: 8) ].
		
		n kind: kind;
		text: txt.
		n.
		 ].
	