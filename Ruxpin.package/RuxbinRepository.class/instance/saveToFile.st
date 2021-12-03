as yet unclassified
saveToFile
  |uim fref stream|

  uim := UIManager default.
	
	fref := (uim chooseForSaveFileReference: 'Save file' extensions: #('ston') path: (FileLocator home fullPath)) asFileReference .
	stream := fref writeStream.
	self saveToStream: stream.
	stream close.