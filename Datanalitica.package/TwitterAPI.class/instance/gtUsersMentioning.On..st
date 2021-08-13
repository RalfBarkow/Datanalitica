accessing
gtUsersMentioning: userName On: aView
	<gtView>
	^ aView columnedList
		title: 'Users mentioning @',userName  translated;
		priority: 5;
		items: [ self usersMentioning: userName ];
		column: 'Imagen' 
			icon: [ :aTwitterUser | aTwitterUser profileImage asElement asScalableElement size: 32 @ 32 ]
			width: 75;
		column: 'User Name' text: [ :aTwitterUser | aTwitterUser userName ];
		column: 'Name' text: [ :aTwitterUser | aTwitterUser name ]