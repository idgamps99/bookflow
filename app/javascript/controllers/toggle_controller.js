import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement", "toggleEdit"]

  connect() {
    console.log("Hello from toggle_controller.js");
  }

  fireReview() {
    this.togglableElementTarget.classList.toggle("d-none"); // Toggling the review form
  }

  fireEdit() {
    this.toggleEditTarget.classList.toggle("d-none"); // Toggling the edit form
    console.log("hello");
  }
}
