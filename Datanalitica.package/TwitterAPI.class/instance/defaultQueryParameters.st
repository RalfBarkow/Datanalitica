accessing
defaultQueryParameters
	^ Dictionary new
		at: 'tweetsOrig' put: '?tweet.fields=created_at&expansions=author_id&user.fields=created_at&max_results=100';
		at: 'tweets' put: '?', 'tweet.fields=created_at', '&', 'expansions=author_id', '&', 'max_results=100';
		at: 'mentionsOrig' put: '?expansions=author_id&tweet.fields=conversation_id,created_at,lang&user.fields=created_at,entities&max_results=100';
		yourself