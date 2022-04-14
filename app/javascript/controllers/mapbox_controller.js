import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"


export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({

      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [7.259382, 43.702955],
      zoom: 15
    })

    this.#addControlToMap()
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.#calculateDistance()
    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))

  }


  #addControlToMap() {
    this.map.addControl(
      new mapboxgl.GeolocateControl({
          positionOptions: {
              enableHighAccuracy: true
          },
          // When active the map will receive updates to the device's location as it changes.
          trackUserLocation: true,
          // Draw an arrow next to the location dot to indicate which direction the device is heading.
          showUserHeading: true
      })
  );
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new
      mapboxgl.Popup().setHTML(marker.info_window)
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "cover"
      customMarker.style.backgroundRepeat = "no_repeat"
      customMarker.style.width = "25px"
      customMarker.style.height = "35px"
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #calculateDistance() {
    const to = [lng, lat] //lng, lat
    const from = [lng, lat] //lng, lat
   to.lng = this.markersValue.first.lng
   to.lat = this.markersValue.first.lat
   console.log(to);
  }

}
