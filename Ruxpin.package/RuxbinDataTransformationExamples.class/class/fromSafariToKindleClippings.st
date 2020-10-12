instance creation
fromSafariToKindleClippings
	| ri ru stream parsedKnowledgeEntries ro outputStream |
	
	ru := RuxpinUIUtils new.
	stream := ru chooseFileAndMakeFileStream.
	ri := RuxpinInputParserOriellySafariAnnotationsExport createWithOutputOfStream: stream.
	parsedKnowledgeEntries := ri parseStream.
	ro := RuxpinOutputPresenterAmazonMyClippingsFormat new.
	outputStream := String new writeStream.
	
	(parsedKnowledgeEntries
		collect: [ :currentItem | ro formatOneKnowledgeEntry: currentItem ])
		asStringOn: outputStream
		delimiter: String cr.
	outputStream contents