accessing
fromDictionary: userDict 
	id := userDict at: 'id'.
	name := userDict at: 'name'.
	userName := userDict at: 'username'.
	createdAt := userDict at: 'created_at'.
	profileImageUrl := userDict at: 'profile_image_url'.
	description := userDict at: 'description'.