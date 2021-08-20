accessing
messagesAuthors
	| groupedTweets |
	self includes at: 'users' ifAbsent: [ ^ nil ].
	groupedTweets := self data groupedBy: [:each | each at: 'author_id' ].
	^ (self includes at: 'users') collect: [:userDict |  | user |
		user := TwitterUser new fromDictionary: userDict.
		(groupedTweets at: (user id)) do: [:tweetDict | 
			user tweets add: (Tweet new fromDictionary: tweetDict) 
		].
		user.
	  ]