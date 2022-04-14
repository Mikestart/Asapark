

  <body>
    <div id='map'></div>
    <div id='map-overlay'>Distance: </div>
    <script>
      mapboxgl.accessToken = 'pk.eyJ1IjoibWpkYW5pZWxzb24iLCJhIjoiY2tkNm4wMTdoMml2bDJzbXlvZGp4YW0xcyJ9.gVoNxvWvLwK2Ev6ukzArsQ';
      var map = new mapboxgl.Map({
        container: 'map', // container id
        style: 'mapbox://styles/mapbox/streets-v11',
        center: [-89.384, 43.101],
        zoom: 5
      });

      //YOUR TURN: Replace var to = [lng, lat] with the lng/lat for Madison, WI [-89.384, 43.101]
      //YOUR TURN: Replace var to = [lng, lat] with the lng/lat for Chicago, Il [-87.627, 41.919]

      var to = [lng, lat] //lng, lat
      var from = [lng, lat] //lng, lat

      var greenMarker = new mapboxgl.Marker({
          color: 'green'
        })
        .setLngLat(to) // marker position using variable 'to'
        .addTo(map); //add marker to map

      var purpleMarker = new mapboxgl.Marker({
          color: 'purple'
        })
        .setLngLat(from) // marker position using variable 'from'
        .addTo(map); //add marker to map

      var options = {
        units: 'miles'
      }; // units can be degrees, radians, miles, or kilometers, just be sure to change the units in the text box to match.

      var distance = turf.distance(to, from, options);

      var value = document.getElementById('map-overlay')
      value.innerHTML = "Distance: " + distance.toFixed([2]) + " miles"

    </script>
  </body>

</html>
