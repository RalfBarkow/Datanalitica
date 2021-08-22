accessing
printOn: aStream
	super printOn: aStream.
	aStream
		nextPutAll: '( ', self users size asString, ' users )'