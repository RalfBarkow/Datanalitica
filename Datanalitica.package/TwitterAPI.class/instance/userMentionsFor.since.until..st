accessing
userMentionsFor: username since: startDateString until: endDateString
	| nextToken queryUrl sinceDate untilDate messages response extraQueryParamenters |
	
	sinceDate := 'start_time=',startDateString, 'T17:00:00Z'.
	untilDate := 'end_time=',endDateString, 'T01:00:00Z'.
	extraQueryParamenters := '?expansions=author_id&tweet.fields=conversation_id&user.fields=created_at,entities&max_results=100'.
	messages := OrderedCollection new.
	nextToken := ''.
	[ nextToken includesSubstring: 'stop' ] whileFalse: [
		queryUrl := self usersBaseEndPoint, 
			(self userIDFrom: username), '/mentions', extraQueryParamenters, 
			'&', sinceDate,  
			"'&', untilDate,"
			'&', nextToken.
		response := STONJSON fromString: (self rawResponseForURL: queryUrl).
		(response at: 'data') do: [:tweetData | 
			messages add: (Tweet new fromDictionary: tweetData) 
		].
		nextToken := 'pagination_token=',((response at: 'meta') at: 'next_token' ifAbsent: [ 'stop' ])].
^ messages.