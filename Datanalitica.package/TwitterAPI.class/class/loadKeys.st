accessing
loadKeys
	keys := STONJSON fromString: FileLocator home / '.config/Datanalitica/twitter-api-keys.json' contents.
	^ self keys