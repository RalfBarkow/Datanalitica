accessing
userTweetsFrom: username since: startDateString until: endDateString
	| nextToken queryUrl sinceDate untilDate messages response |
	
	sinceDate := 'start_time=',startDateString, 'T17:00:00Z'.
	untilDate := 'end_time=',endDateString, 'T01:00:00Z'.
	messages := OrderedCollection new.
	nextToken := ''.
	[ nextToken includesSubstring: 'stop' ] whileFalse: [
		queryUrl := self usersBaseEndPoint, 
			(self userIDFrom: username), '/tweets', self defaultQueryParameters, 
			'&', sinceDate,  
			'&', untilDate, 
			'&', nextToken.
		response := STONJSON fromString: (self rawResponseForURL: queryUrl).
		messages addAll: (response at: 'data').
		nextToken := 'pagination_token=',((response at: 'meta') at: 'next_token' ifAbsent: [ 'stop' ])].
^ messages.