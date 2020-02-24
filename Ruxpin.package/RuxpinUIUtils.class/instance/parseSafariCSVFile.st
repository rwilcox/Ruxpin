parsing
parseSafariCSVFile
	|fstream parser|

fstream := (UIManager default chooseFullFileNameMatching: #('*.csv' ) label: nil) asFileReference readStream.

parser := RuxpinInputParserOriellySafariAnnotationsExport createWithOutputOfStream: fstream.
^ parser parseStream .
