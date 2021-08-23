accessing
asCardElement

	^ BrHorizontalPane new
		  hFitContent;
		  vFitContent;
		  padding: (BlInsets all: 15);
		  margin: (BlInsets all: 10);
		  addChild:
			  (self user profileImage asElement asScalableElement size: 64 @ 64);
		  addChild: (BrVerticalPane new
				   exact: 250;
				   margin: (BlInsets left: 20);
				   addChild: (BrLabel new
						    aptitude: BrGlamorousLabelAptitude;
						    text: '@' , self user userName , ' | ' , self created asString;
						    beSmallSize);
				   addChild: (BrEditor new
						    aptitude: BrGlamorousRegularEditorAptitude new;
							beReadOnlyWithSelection;
						    text: self text));
		  when: BlClickEvent do: [ :e | e target phlow spawnObject: self ]