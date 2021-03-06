accessing
userTweetsFrom: username since: startDateString until: endDateString
	| nextToken queryUrl sinceDate untilDate messages response |
	
	sinceDate := 'start_time=',startDateString, 'T00:00:00Z'.
	untilDate := 'end_time=',endDateString, 'T23:59:59Z'.
	messages := OrderedCollection new.
	nextToken := ''.
	[ nextToken includesSubstring: 'stop' ] whileFalse: [
		queryUrl := self usersBaseEndPoint, 
			(self userIDFrom: username), '/tweets', (self defaultQueryParameters at: 'tweets'), 
			'&', sinceDate,  
			'&', untilDate, 
			'&', nextToken.
		response := STONJSON fromString: (self rawResponseForURL: queryUrl).
		(response at: 'data') do: [:tweetData | 
			messages add: (Tweet new fromDictionary: tweetData) 
		].
		nextToken := 'pagination_token=',((response at: 'meta') at: 'next_token' ifAbsent: [ 'stop' ])].
^ messages.