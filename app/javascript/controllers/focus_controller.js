import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="focus"
export default class extends Controller {
  static values = {
    selector: String
  };

  connect() {
    this.#setFocus();

    this.element.remove();
  }

  // private

  #setFocus() {
    if (!this.hasSelectorValue) return;

    requestAnimationFrame(() => {
      document.querySelector(this.selectorValue)?.focus()
    });
  }
}
