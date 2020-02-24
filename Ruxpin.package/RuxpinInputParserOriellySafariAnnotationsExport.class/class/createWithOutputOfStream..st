as yet unclassified
createWithOutputOfStream: stream
	"Create the parser to process the contents of the given stream"

	| out |
	out := RuxpinInputParserOriellySafariAnnotationsExport new.
	out inputStream: stream.
	^ out.