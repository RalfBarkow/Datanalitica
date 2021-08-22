ui
asCardElement
	^ BrHorizontalPane new 
		hFitContent;
		vFitContent;
		padding: (BlInsets all: 20);
		margin: (BlInsets all: 10);		
		addChild: (self profileImage asElement asScalableElement size: 64@64);
		addChild: (BrVerticalPane new
			fitContent;
			margin: (BlInsets left: 20);
			addChild: (BlTextElement new
				constraintsDo: [ :c | 
					c horizontal fitContent ];
				margin: (BlInsets top: 5 right: 0 bottom: 5 left: 5);
				text: (('@', self userName) asRopedText glamorousRegularFont
					fontSize: 20;
					foreground: Color black));
			addChild: (BrLabel new aptitude: BrGlamorousLabelAptitude; text: self name);
			addChild: (BrLabel new aptitude: BrGlamorousLabelAptitude; text: 'joined: ', self createdAtShorted);
			addChild: (BrLabel new aptitude: BrGlamorousLabelAptitude; text: self description));
		when: BlClickEvent do: [:e | e target phlow spawnObject: self]