accessing
usersGroupMentioning: userName
	^ TwitterUsersGroup new
		users: (self usersMentioning: userName);
		title: 'Users mentioning @', userName