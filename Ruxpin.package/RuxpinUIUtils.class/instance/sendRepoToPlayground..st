as yet unclassified
sendRepoToPlayground: repo
	|bindings playground|
	
    bindings := Dictionary newFrom: {(#repo -> repo)}.
	
	playground := Smalltalk tools workspace openContents: 'repo'.
	playground setBindings: bindings