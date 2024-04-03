import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = [ "toggleme" ]
  // connect() {}
  toggle(){
    let idx = event.target.dataset.who ||= 0
    this.togglemeTargets[idx].classList.toggle('hidden')
  }
}
