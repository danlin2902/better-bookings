import "bootstrap";
import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

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
