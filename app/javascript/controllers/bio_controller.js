import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "form", "edit", "bio" ]
    static classes = [ "hide" ]
  connect() {
    if (this.hasFormTarget) {
        this.formTarget.classList.toggle(this.hideClass)
    }
  }

  toggleTargets() {
    if (this.hasFormTarget) {
        this.formTarget.classList.toggle(this.hideClass)
    }
    if (this.hasBioTarget && this.hasEditTarget) {
        this.bioTarget.classList.toggle(this.hideClass)
        this.editTarget.classList.toggle(this.hideClass)
    }
  }
}
