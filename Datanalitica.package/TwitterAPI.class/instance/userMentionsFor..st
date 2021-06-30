accessing
userMentionsFor: username
	| rawResponse queryURL parameters |
	"The following query gets the last tweets, that is the maximun allowed for a particular user without pagination:"
	queryURL := self usersBaseEndPoint, (self userIDFrom: username), '/mentions', self defaultQueryParameters.
	rawResponse := self rawResponseForURL:queryURL.  
	^ (STONJSON fromString: rawResponse)