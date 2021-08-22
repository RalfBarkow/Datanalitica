accessing
asCardElement

	^ BrHorizontalPane new
		  hFitContent;
		  vFitContent;
		  padding: (BlInsets all: 20);
		  margin: (BlInsets all: 10);
		  addChild:
			  (self user profileImage asElement asScalableElement size: 64 @ 64);
		  addChild: (BrVerticalPane new
				   fitContent;
				   margin: (BlInsets left: 20);
				   addChild: (BrLabel new
						    aptitude: BrGlamorousLabelAptitude;
						    text: '@' , self user name , ' | ' , self created asString;
						    beSmallSize);
				   addChild: (BrLabel new
						    aptitude: BrGlamorousLabelAptitude;
						    text: self text));
		  when: BlClickEvent do: [ :e | e target phlow spawnObject: self ]