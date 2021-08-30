accessing
usersGroupMentioning: userName
	| response |
	response := self userQueryFor: userName selecting: 'mentions'.
	^ TwitterUsersGroup new
		users: response messagesAuthors;
		title: 'Users mentioning @', userName;
		origin: response queryURL