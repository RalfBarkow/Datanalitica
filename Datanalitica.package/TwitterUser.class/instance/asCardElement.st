accessing
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
			addChild: (BrLabel new aptitude: BrGlamorousLabelAptitude; text: '@', self  userName);
			addChild: (BrLabel new aptitude: BrGlamorousLabelAptitude; text: self name);
			addChild: (BrLabel new aptitude: BrGlamorousLabelAptitude; text: 'joined: ', self createdAtShorted));
		when: BlClickEvent do: [:e | e target phlow spawnObject: self]