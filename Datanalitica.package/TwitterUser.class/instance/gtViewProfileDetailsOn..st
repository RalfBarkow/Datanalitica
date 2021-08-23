accessing
gtViewProfileDetailsOn: aView
	<gtView>
	^ aView explicit 
		title: 'Details' translated;
		priority: 5;
			stencil: [ 
			| container imageContainer |
			container := BlElement new
				layout: BlFlowLayout new;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal matchParent ];
				padding: (BlInsets all: 10).
			imageContainer := BlLazyElement new
				withGlamorousPreview;
				aptitude: BrShadowAptitude new;
				background: Color white;
				margin: (BlInsets all: 20);
				constraintsDo: [ :c | 
						c vertical exact: 150. 
						c horizontal matchParent ];
				elementBuilder: [ self asCardElement margin: (BlInsets all: 20) ].
			container addChild: imageContainer].