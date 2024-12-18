import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement", "toggleEdit", "toggleTabEdit"]


  fireReview() {
    this.togglableElementTarget.classList.toggle("d-none"); // Toggling the review form
  }

  fireEdit() {
    this.toggleEditTarget.classList.toggle("d-none"); // Toggling the edit form
  }
}
