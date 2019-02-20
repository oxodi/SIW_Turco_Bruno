<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<title>Display a map</title>
<meta name='viewport'
	content='initial-scale=1,maximum-scale=1,user-scalable=no' />
<script
	src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.53.0/mapbox-gl.js'></script>
<link
	href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.53.0/mapbox-gl.css'
	rel='stylesheet' />
<style>
body {
	margin: 0;
	padding: 0;
}

#map {
	position: absolute;
	top: 0;
	bottom: 0;
	width: 100%;
}
</style>
</head>
<body>

	<div id='map'></div>
	<script>
		mapboxgl.accessToken = 'pk.eyJ1IjoidmluY2V6b2JvMSIsImEiOiJjanNieXMxZ3MwMjI0NDlubWtxdjFibGswIn0._jWzMdZSVOpRdyFAHG8shA';
		var map = new mapboxgl.Map({
			container : 'map', // container id
			style : 'mapbox://styles/mapbox/satellite-v9', // stylesheet location
			center : [ -74.50, 40 ], // starting position [lng, lat]
			zoom : 10
		// starting zoom
		});
		map.addControl(new mapboxgl.NavigationControl());
	</script>

</body>
</html>