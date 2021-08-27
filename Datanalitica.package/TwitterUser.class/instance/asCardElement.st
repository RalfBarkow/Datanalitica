accessing
asCardElement
	| aModeLook anEditor textInfoPane |
	
	aModeLook := BrEditorModeAptitude new
		editableFocused: [ :aWidget | aWidget border: (BlBorder paint: BrGlamorousColors focusedEditorBorderColor width: 1) ];
		editableUnfocused: [ :aWidget | aWidget border: (BlBorder paint: BrGlamorousColors editorBorderColor width: 1) ];
		readOnly: [ :aWidget | aWidget border: BlBorder empty ].

	anEditor := BrEditor new
		aptitude: BrGlamorousRegularEditorAptitude new + aModeLook;
		text: self description;
		vFitContent.
		
	textInfoPane := BrVerticalPane new
				   	hMatchParent;
				   	vFitContent;
				   	margin: (BlInsets left: 20);
				   	addChild: (BrLabel new
						    aptitude: BrGlamorousLabelAptitude;
						    text: '@' , self userName ;
						    beHugeSize);
						addChild: (BrLabel new
						    aptitude: BrGlamorousLabelAptitude;
						    text: self name;
						    beLargeSize);    
						addChild: (BrLabel new
						    aptitude: BrGlamorousLabelAptitude;
						    text: 'Joined: ' , self createdAtShorted );
						addChild: anEditor.    

	^ BrHorizontalPane new
		padding: (BlInsets all: 15);
		margin: (BlInsets all: 10);
		cellSpacing: 5;
		hMatchParent;
		vFitContent;
		addChildren: { 
			(self  profileImage asElement asScalableElement size: 124 @ 124).
			BrVerticalPane new
				cellSpacing: 5;
				hMatchParent;
				vFitContent;
				addChildren: {
					textInfoPane.
					BrHorizontalPane new
						fitContent;
						cellSpacing: 5;
						addChildren: { 
							BrButton new
								aptitude: BrGlamorousButtonWithLabelAptitude new;
								label: 'Tweets';
								action: [ :e | e phlow spawnObject: self tweets ].	
							BrButton new
								aptitude: BrGlamorousButtonWithLabelAptitude new;
								label: 'Web view';
								action: [ self webView ].
				}
			}
		}