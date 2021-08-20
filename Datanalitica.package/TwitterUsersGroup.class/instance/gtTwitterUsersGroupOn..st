accessing
gtTwitterUsersGroupOn: aView
	<gtView>
	^ aView columnedList
		title: self title  translated;
		priority: 5;
		items: [ self users ];
		column: 'Imagen' 
			icon: [ :aTwitterUser | aTwitterUser profileImage asElement asScalableElement size: 32 @ 32 ]
			width: 75;
		column: 'User Name' text: [ :aTwitterUser | '@', aTwitterUser userName ];
		column: 'Name' text: [ :aTwitterUser | aTwitterUser name ];
		column: 'Mentions' text: [ :aTwitterUser | aTwitterUser tweets size asString ]