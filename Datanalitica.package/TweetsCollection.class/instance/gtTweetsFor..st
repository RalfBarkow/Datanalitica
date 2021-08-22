accessing
gtTweetsFor: aView
	<gtView>
	^ aView explicit
		title: 'Tweets';
		stencil: [ 
			| container imageContainer |
			container := BlElement new
				layout: BlFlowLayout new;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal matchParent ];
				padding: (BlInsets all: 10).
			self tweets do: [ :each |
				imageContainer := BlLazyElement new
					withGlamorousPreview;
							aptitude: BrShadowAptitude new;
		background: Color white;

					margin: (BlInsets all: 20);
					constraintsDo: [ :c | 
						c vertical exact: 100. 
						c horizontal exact: 1000 ];
					elementBuilder: [ each asCardElement margin: (BlInsets all: 20) ].
				container addChild: imageContainer].
			container asScrollableElement ]