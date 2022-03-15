formatting
formatOneKnowledgeEntry: inEntry
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| prefixString stepTwoString bodyText formatString formatDictionary|
	"Example of required output: 
@quote-highlight[
	#:title       ""Ask Your Developer""
	#:author      ""Lawson""
        #:is-book?     't
   #:url ""url""
	#:page-number 39 ]{
 text goes here
}

for highights. For notes:

@quote-note[
	#:title       ""Ask Your Developer""
	#:author      ""Lawson""
	#:page-number 127
	#:original-highlight ""highlight""]{
POTIFICATING
}	
"

bodyText := inEntry text.

(inEntry hasPersonalNote) ifTrue: [
	prefixString := ('@quote-note[
		#:original-highlight "{highlight}"	
	' format:  { (#highlight -> (inEntry text)) } asDictionary ).
	
	bodyText := inEntry personalNote.
	] ifFalse: [ 
		prefixString := '@quote-highlight['
	] .

formatString := '#:title "{title}"
  #:author  "{author}"
  #:page-number {page}'.

formatDictionary := { (#title -> (inEntry title)). (#author -> (inEntry author)). (#page -> (inEntry referencePageNumber asString  )) } asDictionary.

inEntry hasUrl ifTrue: [ 
  formatString := ( formatString, '
  #url  "{url}"' ).

  formatDictionary at: #url put: (inEntry url).  
].

stepTwoString := (prefixString , formatString, ']')  format: formatDictionary .

^ (stepTwoString , '{', bodyText , '}' ).