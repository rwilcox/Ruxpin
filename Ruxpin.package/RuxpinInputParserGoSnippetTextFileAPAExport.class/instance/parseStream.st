parsing
parseStream
	"Parse a text based export file from GoSnippet.
	We assue you use APA BUT ALSO with citation below, whih means the book
	information is between the highlighted text and the notes text.
	"

	"scope: class-variables  &  instance-variables"

	| output currentKnowledgeEntry foundFirstLine previousState seperatorLine|
	output := OrderedCollection new.
	foundFirstLine := false.
	currentKnowledgeEntry := nil.
	seperatorLine := '-' repeat: 81.
	
	inputStream
		do: [ :line | 
			
			line patternMatchWithRules: { 
			  PMRule whenMatches: [ foundFirstLine = false ] execute: [ 
				currentKnowledgeEntry := RuxpinKnowledgeEntry new. 
				currentKnowledgeEntry text: ''; personalNote: ''; kind: 'highlight'.
				foundFirstLine := true. 
				previousState := 'dashes'.
			  ].
		
			  PMRule whenMatches: [ line isAllSeparators ]   execute: [  "next line" ].
			  PMRule whenMatches: [ line = seperatorLine  ] execute: [  
				  " dashes mean end of entry. Yes even the last entry has ending dashes. The first entry has no stating dashes"
				  previousState := 'dashes'. 
				  output add: currentKnowledgeEntry.
				
				  "and start a new one..."
			     currentKnowledgeEntry := RuxpinKnowledgeEntry new. 
				  currentKnowledgeEntry text: ''; personalNote: ''; kind: 'highlight'.
				]. 
			  PMRule whenMatches: [  self hasReferenceInformation: line ] execute: [ 
				"check if the line is a reference line aka we have to stop gathering highlighted text. 
				This also come between the highlighted text ad the notes"
				
				self authorInformationFrom: line to: currentKnowledgeEntry.
				previousState := 'title-info' 
			  ].
			  PMRule whenMatches: [ previousState = 'dashes' ] execute: [ 
				"after dashes, not a whilespace line, so highlighted text. Haven't get hit the reference information...."
				currentKnowledgeEntry text: (( currentKnowledgeEntry text), line).
			  ].
		     PMRule whenMatches: [ previousState = 'title-info' ] execute:  [ 
			    "after title info, must be note stuff"
			    currentKnowledgeEntry kind: 'note+highlight'.
			    currentKnowledgeEntry personalNote: ((currentKnowledgeEntry personalNote) , line) ].
			}.
	]. 
	^ output