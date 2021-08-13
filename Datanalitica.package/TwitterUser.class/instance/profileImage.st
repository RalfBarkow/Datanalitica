accessing
profileImage
	| response |
	response := ZnClient new url: (self profileImageUrl); get; response.
	response contentType = ZnMimeType imageJpeg
		ifTrue: [ ^ (JPEGReadWriter gtFromBuffer: response contents) asElement ].
	response contentType = ZnMimeType imagePng
		ifTrue: [ ^ (PNGReadWriter gtFromBuffer: response contents) asElement ].
	^ BlElement new background: Color gray