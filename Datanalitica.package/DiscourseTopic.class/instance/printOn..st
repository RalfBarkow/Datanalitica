accessing
printOn: aStream
	super printOn: aStream.
	aStream
		nextPutAll: '( ',self name, ' | ', self language, ' )'