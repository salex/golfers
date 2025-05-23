import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tag","gameid"]
  // static values = {gameid: String}


  connect() {
    console.log("selectTag found")
    console.log("selectTag found")

    // this.getValue()
  }

  getValue(){
    let game_id = this.gameidTarget.innerHTML

    console.log(this.tagTarget.value)
    console.log(game_id)
    console.log(this.tagTarget.value)

    let course = this.tagTarget.value
    location.assign(`/scheduled/game/${game_id}/change_course?course=${course}`)
  }

}