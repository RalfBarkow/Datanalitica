accessing
messagesAuthors
	self includes at: 'users' ifAbsent: [ ^ nil ].
	^ (self includes at: 'users') collect: [:userDict |
		TwitterUser new fromDictionary: userDict
	  ]