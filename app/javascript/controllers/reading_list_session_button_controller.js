import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["message", "button"]

  connect() {
    console.log("Hello from the reading list controller!");
  }

  // Handles the confirmation message and shows the 'Start Reading Session' button
  fireReview() {
    console.log("Reviewing the reading");
    // event.preventDefault();
    this.messageTarget.classList.remove("d-none");
    this.buttonTarget.classList.remove("d-none");
  }

  // Handles the start reading session action
  fireStartReadingSession() {
    console.log("Reading session started!");
    // You can add further logic to handle the start of a reading session here
  }
}
