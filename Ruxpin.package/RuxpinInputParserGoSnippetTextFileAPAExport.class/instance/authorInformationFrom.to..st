as yet unclassified
authorInformationFrom: line to: currentKnowledgeEntry 
	"parses reference information linto a RuxpinKnowledgeEntry. Lines are assumed to be APA style
	
	WEBSITES:
	Query execution · Apache Druid. [web]. Retrieved from:  https://druid.apache.org/docs/latest/querying/query-execution.html

	BOOKS:
   Greg Thomas. Code Your Way Up: Rise to the Challenge of Software Leadership. [Kindle ebook]. (page 15)
	"
	|webRegex bookRegex|
	
	webRegex  := '(.+)\. \[web\]\. Retrieved from\:  (.+)' asRegex .
	bookRegex := '(.+)\. (.+)\. \[Kindle ebook\]\. \(page (\d+)\)' asRegex.  "probably not actually good, see Dr. Steven Hawking"
	
	line patternMatchWithRules: {  
		PMRule whenMatches: [ :l | l includesSubstring: '. [web].' ] execute: [ 
		  |title url|
		  webRegex matches: line.
		  title := webRegex subexpression: 2.
		  url   := webRegex subexpression: 3.
		
		  currentKnowledgeEntry url: url; title: title.
		].
		PMRule whenMatches: [ :l | l includesSubstring: '. [Kindle ebook].' ] execute: [ 
			|author title pageNumber|
						
			bookRegex matches: line.
			author     := bookRegex subexpression: 2.
			title      := bookRegex subexpression: 3.
			pageNumber := bookRegex subexpression: 4.
			
			currentKnowledgeEntry title: title; author: author;  referencePageNumber: pageNumber.
		].
	}.
	
	^currentKnowledgeEntry.