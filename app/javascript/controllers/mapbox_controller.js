import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

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
      center: [2.64510, 46.71853],
      zoom: 12
    })

    this.#addControlToMap()
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    // this.#addClickToMarker()

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
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }


  // #addClickToMarker() {

  //   this.markersValue.forEach((marker) => {
  //     console.log(this.markers)
  //   marker.getElement().addEventListener('click', event => {
  //     console.log("hello")
  //   });
  // });

  // // element.addEventListener(eventType, (event) => {
  // //   // Do something (callback)
  // // });

  // }
}