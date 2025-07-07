import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  hoverIn(event) {
    event.target.classList.toggle("bi-heart")
    event.target.classList.toggle("bi-heart-fill")
  }

  hoverOut(event) {
    event.target.classList.toggle("bi-heart")
    event.target.classList.toggle("bi-heart-fill")
  }
}
