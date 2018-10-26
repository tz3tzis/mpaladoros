@initMap = ->
	center =
		 lat: 0
		 lng: 0

	map = new (google.maps.Map) $('#map')[0],
		zoom: 2
		center: center

	$.getJSON '/stadia.json', (jsonData) ->
		$.each jsonData, (key, data) ->
			latLng = new (google.maps.LatLng)(data.lan,data.lng)
			marker = new (google.maps.Marker)
			position: latLng
			map: map
			title: data.title

