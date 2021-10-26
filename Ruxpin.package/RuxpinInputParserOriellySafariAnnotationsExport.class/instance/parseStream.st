parsing
parseStream
	| csvOutput|
	csvOutput := (NeoCSVReader on: inputStream) upToEnd .
	
	^ (csvOutput allButFirst) collect: [ :inputLine | | n txt kind|
		
		n := RuxpinKnowledgeEntry new. 
		n title: (inputLine at: 1);
		author: 'N/A' "(inputLine at: 2)";
		chapterTitle: (inputLine at: 2);
		url: (inputLine at: 4);
		referenceLocation: (inputLine at: 6);
		"Safari only gives us a URL to the location, not page number or even byte or whatever"
		
		date: (self parseStringToDate: (inputLine at: 3)).
		
		
		(inputLine at: 8) ifNotNil: [
			"8 is the personal note, 7 is the highlighted text. Support no highlighted text or highlighted text + note"
			(inputLine at: 7) 
				ifNil: [ kind := 'note'. txt := (inputLine at: 8). ]
				ifNotNil: [ 
					kind := 'note+highlight'.
					txt := (inputLine at: 7).
					n personalNote: (inputLine at: 8) ] ] 
		ifNil: [ kind := 'highlight'. txt := (inputLine at: 7) ].
		
		n kind: kind;
		text: txt.
		n.
		 ].
	