accessing
userEndPointFor: username selecting: tweetsOrMentions
	"I build a shared URL for querying last 100 mentions or tweets for a particular user.
	Second parameter should be only 'tweets' or 'mentions', dateString, if present, should be YYYY-MM-DD."
	| commonQueryParameters userFields |
	userFields := 'user.fields=username,name,description,profile_image_url,created_at'.
	commonQueryParameters := '?expansions=author_id&tweet.fields=conversation_id,created_at&', userFields, '&max_results=100'.
	^ self usersBaseEndPoint, (self userIDFrom: username), '/', tweetsOrMentions, commonQueryParameters 