accessing
userMentionsFor: username
	"The following query gets the last 100 mentions that is the maximun allowed for a particular user without pagination:"
	^ self userQueryFor: username selecting: 'mentions'