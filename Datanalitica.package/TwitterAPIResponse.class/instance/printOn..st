accessing
printOn: aStream
	super printOn: aStream.
	aStream
		nextPutAll: '( size: ', self data size asString, ' | next token: ', self nextTokenPreview, ' )'