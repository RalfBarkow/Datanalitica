accessing
fromDictionary: userDict 
	id := userDict at: 'id'.
	name := userDict at: 'name'.
	userName := userDict at: 'username'.
	profileImageUrl := userDict at: 'profile_image_url'.
	description := userDict at: 'description'.