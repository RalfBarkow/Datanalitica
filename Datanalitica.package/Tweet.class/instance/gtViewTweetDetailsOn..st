accessing
gtViewTweetDetailsOn: aView
	<gtView>
	^ aView explicit
		title: 'Tweet Details' translated;
		priority: 5;
		stencil: [ 
			BlElement new
				layout: BlFlowLayout new;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal matchParent ];
				padding: (BlInsets all: 10);
				addChild: (self asCardElement margin: (BlInsets all: 20)) 
		]
		