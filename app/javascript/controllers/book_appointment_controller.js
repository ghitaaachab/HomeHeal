import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    this.element.addEventListener("click", this.submitForm.bind(this));
  }

  submitForm(event) {
    event.preventDefault();
    this.element.closest("form").submit();
  }
}
