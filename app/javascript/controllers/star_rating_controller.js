import { Controller } from "@hotwired/stimulus";
import StarRating from "star-rating.js";

export default class extends Controller {
  connect() {
    this.starRating = new StarRating(this.element, {
      classNames: {
        active: "fa-solid fa-star",
        base: "fa-regular fa-star",
      },
    });
  }
}
