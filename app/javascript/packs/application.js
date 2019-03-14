import "bootstrap";
import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!


// import mapboxgl from 'mapbox-gl';
// import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
// import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
// import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
// const flatpickr = require("flatpickr");


// flatpickr("#range_start", {
//   altInput: true,
//   plugins: [new rangePlugin({ input: "#range_end"})]
// })

flatpickr(".datepicker", {
  // altInput: true,
  // enableTime: true,
  minDate: "today",
  maxDate: new Date().fp_incr(365), // 1 day from now
  altFormat: "F j, Y",
  dateFormat: "Y-m-d",
})
