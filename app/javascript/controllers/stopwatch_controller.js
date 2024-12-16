import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="stopwatch"
export default class extends Controller {
  static targets = ["timer"]

  connect() {
    this.startTime = new Date(); // Set the start time when the controller connects
    this.start(); // Automatically start the timer
  }

  start() {
    this.timerInterval = setInterval(() => {
      const elapsedTime = new Date() - this.startTime;
      this.updateTimeDisplay(elapsedTime);
    }, 1000); // Update every second
  }

  stop() {
    clearInterval(this.timerInterval);
    this.timerInterval = null;
  }

  updateTimeDisplay(ms) {
    const totalSeconds = Math.floor(ms / 1000);
    const minutes = Math.floor(totalSeconds / 60);
    const seconds = totalSeconds % 60;

    // Update only minutes and seconds in the DOM
    this.timerTarget.textContent = `${minutes.toString().padStart(2, "0")}:${seconds.toString().padStart(2, "0")}`;
  }


}
