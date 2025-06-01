import { Controller } from "@hotwired/stimulus"
import { destroy } from "@rails/request.js"

// Connects to data-controller="navigation"
export default class extends Controller {
  static targets = [ "field" ];

  up(event) {
    this.#navigateTo(event, -1);
  }

  down(event) {
    this.#navigateTo(event, 1);
  }

  left(event) {
    const { target } = event;

    if (target.selectionStart !== 0) return;

    this.#navigateTo(event, -1);
  }

  right(event) {
    const { target } = event;

    if (target.selectionEnd !== target.value.length) return;

    this.#navigateTo(event, 1, 0);
  }

  async back(event) {
    if (event.target.value !== "") return;

    this.#navigateTo(event, -1);

    const response = await destroy(event.params.endpoint);

    if (response.ok) event.target.closest("li").remove();
  }

  // private

  #navigateTo(event, direction, position) {
    const currentIndex = this.fieldTargets.indexOf(event.target);
    const newIndex = currentIndex + direction;

    if (newIndex < 0 || newIndex >= this.fieldTargets.length) return;

    event.preventDefault();

    const field = this.fieldTargets[newIndex];

    field.focus();

    const cursorPosition = position ?? field.value.length;

    field.setSelectionRange(cursorPosition, cursorPosition);
  }
}
