accessing
rawResponseForURL: anUrl
	^ ZnClient new
		headerAt: 'Authorization' put: 'Bearer ', self bearerToken;
		url: anUrl;
		get.