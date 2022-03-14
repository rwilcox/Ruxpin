parsing
parseSafariCSVFile
	|fstream parser res|

fstream := (UIManager default chooseFullFileNameMatching: #('*.csv' ) label: nil) asFileReference readStream.

parser := RuxpinInputParserOriellySafariAnnotationsExport createWithOutputOfStream: fstream.

res := parser parseStream .
"TODO: close file?"
^ res .
