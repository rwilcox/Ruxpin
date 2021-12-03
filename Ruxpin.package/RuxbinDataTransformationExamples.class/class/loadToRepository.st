as yet unclassified
loadToRepository
	
| ri ru stream parsedKnowledgeEntries ro outputStream repo|
	
	ru := RuxpinUIUtils new.
	stream := ru chooseFileAndMakeFileStream.
	ri := RuxpinInputParserOriellySafariAnnotationsExport createWithOutputOfStream: stream.
	parsedKnowledgeEntries := ri parseStream.
	

   repo := RuxbinRepository new.
   repo addAll: parsedKnowledgeEntries .

   ^ repo.
   