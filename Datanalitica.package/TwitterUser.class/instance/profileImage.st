accessing
profileImage
	| response |
	response := ZnClient new url: (self profileImageUrl); get; response.
	response contentType = ZnMimeType imageJpeg
		ifTrue: [ | imageTemp |
			imageTemp := [ JPEGReadWriter gtFromBuffer: response contents ].
			imageTemp on: Error do: [ ^ GtABContact new avatar ].
			^ imageTemp value asElement 
		].
	response contentType = ZnMimeType imagePng
		ifTrue: [ | imageTemp |
			imageTemp := [ PNGReadWriter gtFromBuffer: response contents ].
			imageTemp on: Error do: [ ^ GtABContact new avatar ].
			^ imageTemp value asElement 
		].
	^ BlElement new background: Color gray