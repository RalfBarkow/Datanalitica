accessing
userTweetsFrom: username
	| rawResponse queryURL parameters |
	"The following query gets the last 100 tweets, that is the maximun allowed for a particular user without pagination:"
	parameters := '?tweet.fields=created_at&expansions=author_id&user.fields=created_at&max_results=100'.
	queryURL := self usersBaseEndPoint, (self userIDFrom: username), '/tweets', parameters. 
	rawResponse := self rawResponseForURL:queryURL.  
	^ (STONJSON fromString: rawResponse)