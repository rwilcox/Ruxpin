formatting APIs
formatOneKnowledgeEntry: entry
	| ourKind startStr formattedDateString|
	"formatted date: Sunday, January 26, 2020 8:15:07 PM"
	ourKind := entry kind = 'note'
		ifTrue: [ 'Note' ]
		ifFalse: [ 'Highlight' ].
		formattedDateString := self formatDateForAmazonClipping: entry date.
		
	startStr := '{title} ({author})
- Your {kind} on page {pageNumber} | Location {location} | Added on {date}

---Highlight--- {text} ---URL Location--- {locationURL}
==========
'
		format:
			{ (#title -> entry title).
			(#author -> entry author).
			#kind -> ourKind.
			#pageNumber -> entry referencePageNumber.
			#location -> entry referencePageNumber.  "is looking for a number, not URL"
			#date -> formattedDateString.
			#text -> entry text.
			#locationURL -> entry url.
			  } asDictionary.
			
		^ startStr. 