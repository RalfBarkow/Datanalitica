accessing
userTweetsFrom: username
	| rawResponse queryURL |
	"The following query gets the last 100 tweets, that is the maximun allowed for a particular user without pagination:"
	queryURL := self usersBaseEndPoint, (self userIDFrom: username), '/tweets', self defaultQueryParameters at: 'tweets'.
	rawResponse := self rawResponseForURL:queryURL.  
	^ (STONJSON fromString: rawResponse)