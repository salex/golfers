import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
    document.body.style.backgroundColor = "#0F3E61"

  }
}
