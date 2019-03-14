import "bootstrap";
import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css"; // Note this is important!




import { initMapbox } from '../plugins/init_mapbox';

initMapbox();





flatpickr(".datepicker", {

  minDate: "today",
  maxDate: new Date().fp_incr(365),
  altFormat: "F j, Y",
  dateFormat: "Y-m-d",
})
