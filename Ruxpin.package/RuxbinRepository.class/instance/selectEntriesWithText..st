as yet unclassified
selectEntriesWithText: txt
	"Given a search string return elements with this in their text."
	
	^ self select: [ :curr | |a|
		a := ((
		     (curr personalNote ifNil: '') findString: txt) > 0) 
		or: [
			   ((curr text ifNil: '') findString: txt) > 0].
		a or: [((curr title ifNil: '') findString: txt) > 0 ].
	 ].
	