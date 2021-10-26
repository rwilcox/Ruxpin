as yet unclassified
rawDataObjectToPresenter
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
  |kEntry presenter|

  kEntry := RuxpinKnowledgeEntry new.
  kEntry author: 'Ryan'; personalNote: 'maaaybe'; referencePageNumber: 42; text: 'You can''t be a muse and happy too.'.


  presenter := RuxbinOutputPresenterRacketScribbleReferenceFormat new.
  ^ presenter formatOneKnowledgeEntry: kEntry.  