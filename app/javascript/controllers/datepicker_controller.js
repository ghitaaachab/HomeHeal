// app/javascript/controllers/datepicker_controller.js

import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    const disabledDatesUrl = this.data.get("disabledDatesUrl");

    flatpickr(this.element, {
      disable: [
        function(date) {
          // Check if the date is in the array of disabled dates
          return window.disabledDates && window.disabledDates.includes(date.toISOString().split('T')[0]);
        }
      ],
      minDate: "today",
    });
  }
}
