import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static values = {
    debounce: { type: Number, default: 500 }
  }

  connect() {
    this.timeout = null;
  }

  disconnect() {
    clearTimeout(this.timeout);
  }

  submit() {
    clearTimeout(this.timeout);

    this.timeout = setTimeout(() => this.element.requestSubmit(), this.debounceValue);
  }
}
