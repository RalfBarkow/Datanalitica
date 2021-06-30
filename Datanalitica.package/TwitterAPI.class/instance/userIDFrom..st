queries
userIDFrom: username
	| rawResponse |
	rawResponse := self rawResponseForURL: self usersBaseEndPoint, 'by/username/', username.
	^ (STONJSON fromString: rawResponse) at: 'data' at: 'id'