testing
hasReferenceInformation: line
	"reference information lines are assumed to be APA style
	
	WEBSITES:
	Query execution · Apache Druid. [web]. Retrieved from:  https://druid.apache.org/docs/latest/querying/query-execution.html

	BOOKS:
   Greg Thomas. Code Your Way Up: Rise to the Challenge of Software Leadership. [Kindle ebook]. (page 15)
	"
	
  ^ (line includesSubstring: ' [Kindle ebook]. ') or: (line includesSubstring: ' [web]. ').  "TODO: support other types of sources?"