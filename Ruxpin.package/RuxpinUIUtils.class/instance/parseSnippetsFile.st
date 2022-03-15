parsing
parseSnippetsFile

|fstream parser lineStream|

fstream := (UIManager default chooseFullFileNameMatching: #('*.txt' ) label: nil) asFileReference readStream.
lineStream := LineByLineStream new.
lineStream stream: fstream .

parser := RuxpinInputParserGoSnippetTextFileAPAExport createWithOutputOfStream: lineStream .

^ parser parseStream .