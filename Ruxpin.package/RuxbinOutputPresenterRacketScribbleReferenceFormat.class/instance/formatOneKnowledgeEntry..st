formatting
formatOneKnowledgeEntry: inEntry
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| prefixString stepTwoString bodyText|
	"Example of required output: 
@quote-highlight[
	#:title       ""Ask Your Developer""
	#:author      ""Lawson""
        #:is-book?     't
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

inEntry personalNote ifNotNil: [
	prefixString := ('@quote-note[
		#:original-highlight "{highlight}"	
	' format:  { (#highlight -> (inEntry text)) } asDictionary ).
	
	bodyText := inEntry personalNote.
	] ifNil: [ 
		prefixString := '@quote-highlight['
	] .

stepTwoString := prefixString , ('#:title "{title}"
  #:author  "{author}"
  #:page-number {page}]') format: { (#title -> (inEntry title)). (#author -> (inEntry author)). (#page -> (inEntry referencePageNumber asString  )) } asDictionary .

^ (stepTwoString , '{', bodyText , '}' ).