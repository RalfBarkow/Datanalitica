accessing
userTweetsFrom: username
	"The following query gets the last 100 tweets, that is the maximun allowed for a particular user without pagination:"
	^ self userQueryFor: username selecting: 'tweets'