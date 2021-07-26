accessing
userEndPointFor: username selecting: tweetsOrMentions
	"I build a shared URL for querying last 100 mentions or tweets for a particular user.
	Second parameter should be only 'tweets' or 'mentions', dateString should be YYYY-MM-DD."
	| commonQueryParameters |
	commonQueryParameters := '?expansions=author_id&tweet.fields=conversation_id,created_at&user.fields=username&max_results=100'.
	^ self usersBaseEndPoint, (self userIDFrom: username), '/', tweetsOrMentions, commonQueryParameters 