accessing
asTestCardElement
	<gtExample>
	| aModeLook anEditor textInfoPane |
	
	aModeLook := BrEditorModeAptitude new
		editableFocused: [ :aWidget | aWidget border: (BlBorder paint: BrGlamorousColors focusedEditorBorderColor width: 1) ];
		editableUnfocused: [ :aWidget | aWidget border: (BlBorder paint: BrGlamorousColors editorBorderColor width: 1) ];
		readOnly: [ :aWidget | aWidget border: BlBorder empty ].

	anEditor := BrEditor new
		aptitude: BrGlamorousRegularEditorAptitude new + aModeLook;
		text: self text;
		vFitContent.
		
	textInfoPane := BrVerticalPane new
				   	hMatchParent;
				   	vFitContent;
				   	margin: (BlInsets left: 20);
				   	addChild: (BrLabel new
						    aptitude: BrGlamorousLabelAptitude;
						    text: '@' , self user userName , ' | ' , self created asString;
						    beSmallSize);
						addChild: anEditor.    

	^ BrHorizontalPane new
		padding: (BlInsets all: 15);
		margin: (BlInsets all: 10);
		cellSpacing: 5;
		hMatchParent;
		vFitContent;
		addChildren: { 
			(self user profileImage asElement asScalableElement size: 64 @ 64).
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
								label: 'Toggle subtopics';
								action: [ anEditor beEditable ].
							BrButton new
								aptitude: BrGlamorousButtonWithLabelAptitude new;
								label: 'Add subtopic keyword';
								action: [ anEditor beReadOnlyWithSelection ].
							BrButton new
								aptitude: BrGlamorousButtonWithLabelAptitude new;
								label: 'Details';
								action: [ anEditor beReadOnlyWithSelection ].	
							BrButton new
								aptitude: BrGlamorousButtonWithLabelAptitude new;
								label: 'Web view';
								action: [ anEditor beReadOnlyWithoutSelection ].
				}
			}
		}