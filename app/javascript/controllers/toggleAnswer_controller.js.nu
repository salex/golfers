import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [  ]

  connect() {
    console.log("got question ")
  }

  toggle(){
    let answer = event.target.children[0]
    console.log(answer)
    if (answer.classList.contains('w3-hide')) {
      answer.classList.remove('w3-hide')
      answer.classList.add('w3-show')

    }else{
      answer.classList.remove('w3-show')
      answer.classList.add('w3-hide')

    }
  }

}
