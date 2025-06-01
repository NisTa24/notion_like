import { Controller } from "@hotwired/stimulus"
import { post } from "@rails/request.js"

// Connects to data-controller="blocks"
export default class extends Controller {
  static targets = [ "field" ];
  static values = {
    createUrl: String,
    type: { type: String, default: "Block::Text" }
  };

  async create(event) {
    if (this.#notLastField(event.target)) return;
    if (this.#notAtEnd(event.target)) return;

    await post(this.createUrlValue, {
      body: JSON.stringify({ blockable_type: this.typeValue }),
      responseKind: "turbo-stream"
    })
  }

  // private

  #notLastField(field) {
    return this.fieldTargets.indexOf(field) < this.fieldTargets.length - 1;
  }

  #notAtEnd(field) {
    return field.selectionStart < field.value.length;
  }
}
