accessing
userQueryFor: username selecting: tweetsOrMentions
	| rawResponse queryURL |
	"The following query gets the last 100 tweets or mentions that is the maximun allowed for a particular user without pagination:"
	queryURL := self userEndPointFor: username selecting: tweetsOrMentions.
	rawResponse := self rawResponseForURL:queryURL.  
	^ TwitterAPIResponse new fromDictionary: (STONJSON fromString: rawResponse)