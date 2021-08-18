accessing
gtViewContactDetailsOn: aView
	<gtView>
	^ aView explicit 
		title: 'Details' translated;
		priority: 5;
		stencil: [
			|container verticalContainer detailsTextContainer avatarContainer nameTextContainer details|
			details := String streamContents: [:aStream |
				aStream nextPutAll: self name.
				aStream cr.
				].
			
			container := BlElement new
				layout: BlLinearLayout horizontal;
				background: Color white;
				aptitude: BrShadowAptitude;
				margin: (BlInsets all: 20);
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent].
			avatarContainer := BlElement new
				size: 124@124;
				background: (self profileImage scaledToSize: 124@124);
				margin: (BlInsets all: 10).
			nameTextContainer := BlTextElement new
				constraintsDo: [ :c | 
					c horizontal matchParent ];
				margin: (BlInsets top: 5 right: 0 bottom: 20 left: 5);
				text: (('@', self userName) asRopedText glamorousRegularFont
					fontSize: 30;
					foreground: Color black).
			detailsTextContainer := BrEditor new
				aptitude: (BrGlamorousRegularEditorAptitude new fontSize: 16);
				text: details;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ].
			verticalContainer := BlElement new
				layout: BlLinearLayout vertical;
				margin: (BlInsets all: 10);
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent].
			verticalContainer addChild: nameTextContainer.
			verticalContainer addChild: detailsTextContainer.
			container addChild: avatarContainer.
			container addChild: verticalContainer.
			container ].