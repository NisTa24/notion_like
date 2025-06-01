import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="resize"
export default class extends Controller {
  connect() {
    this.now();
  }

  now() {
    this.element.style.height = "auto";

    this.element.style.height = `${this.element.scrollHeight}px`
  }
}
