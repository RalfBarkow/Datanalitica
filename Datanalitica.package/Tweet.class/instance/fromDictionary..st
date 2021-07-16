accessing
fromDictionary: aDictionary
	created := (aDictionary at: 'created_at') asDateAndTime.
	text := aDictionary at: 'text'.
	id := aDictionary at: 'id'.
	authorId := aDictionary at: 'author_id'.
	username := aDictionary at: 'username' ifAbsent: [''] .
	conversationId := aDictionary at: 'conversation_id' ifAbsent: [ '' ].
	^ self