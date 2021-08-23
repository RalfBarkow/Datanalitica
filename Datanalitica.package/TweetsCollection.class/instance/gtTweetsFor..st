ui
gtTweetsFor: aView
	<gtView>
	^ aView explicit
		title: 'Tweets';
		stencil: [ 
			| container imageContainer |
			container := BlElement new
				layout: BlFlowLayout new;
				constraintsDo: [ :c | 
					c vertical matchParent.
					c horizontal matchParent ];
				padding: (BlInsets all: 10).
			self tweets do: [ :each |
				imageContainer := BlLazyElement new
					withGlamorousPreview;
							aptitude: BrShadowAptitude new;
		background: Color white;

					margin: (BlInsets all: 20);
					constraintsDo: [ :c | 
						c vertical exact: 200. 
						c horizontal matchParent ];
					elementBuilder: [ each asCardElement margin: (BlInsets all: 20) ].
				container addChild: imageContainer].
			container asScrollableElement ]