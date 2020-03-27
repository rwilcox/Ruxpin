formatting APIs
formatOneKnowledgeEntry: entry
	| ourKind startStr formattedDateString personalNotePresentation|
	personalNotePresentation := ''.
	
	entry personalNote ifNotNil: [ 
		personalNotePresentation := '---Note-- ', (entry personalNote).
	
	].
	"ourKind := entry kind = 'highlight'
		ifTrue: [ 'Highlight' ]
		ifFalse: [ 'Note' ]."
		" ^^^ gosnippets ONLY supports Highlights, not Notes. RPW 03/27/2020"
	ourKind := 'Highlight'.
	
	formattedDateString := self formatDateForAmazonClipping: entry date.
		
	"format it per Amazon's format... and inside that shove some metadata, because Amazon's My Clipping's format really isn't meant for this.... "
	startStr := '{title} ({author})
- Your {kind} on page {pageNumber} | Location {location} | Added on {date}

---Highlight--- {text} {personalNoteSection} ---URL Location--- {locationURL}
=========='
		format:
			{ (#title -> entry title).
			(#author -> entry author).
			#kind -> ourKind.
			#pageNumber -> entry referencePageNumber.
			#location -> entry referencePageNumber.  "is looking for a number, not URL"
			#date -> formattedDateString.
			#text -> entry text.
			#locationURL -> entry url.
			#personalNoteSection -> personalNotePresentation.
			  } asDictionary.
			
		^ startStr. 