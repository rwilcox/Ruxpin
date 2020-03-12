as yet unclassified
chooseFileAndMakeFileStream
	"creates an open file dialog"

| uim stream openFileFileReference |

	uim := UIManager default.

	(uim respondsTo: #chooseExistingFileReference:extensions:path:preview)
		ifTrue: [ openFileFileReference := uim
				chooseExistingFileReference: ''
				extensions: nil
				path: ''
				preview: nil ]
		ifFalse: [ openFileFileReference := (uim chooseFullFileNameMatching: #('*.*') label: nil) asFileReference ].

	stream := openFileFileReference readStream.
	^ stream.