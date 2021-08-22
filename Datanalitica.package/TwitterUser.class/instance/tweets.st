accessing
tweets
	^ tweets ifNil: [ tweets := TweetsCollection new]