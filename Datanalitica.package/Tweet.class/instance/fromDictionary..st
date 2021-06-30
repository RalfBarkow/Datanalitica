accessing
fromDictionary: aDictionary
	created := (aDictionary at: 'created_at') asDateAndTime.
	text := aDictionary at: 'text'.
	id := aDictionary at: 'id'.
	authorId := aDictionary at: 'author_id'.
	^ self