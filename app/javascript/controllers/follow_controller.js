import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "button" ]
    static values = { text: String }
    static classes = [ "danger" ]
    toggleAction() {
        if (this.hasButtonTarget && this.hasTextValue) {
            this.buttonTarget.classList.toggle(this.dangerClass)
            const temp = this.buttonTarget.textContent
            this.buttonTarget.textContent = this.textValue
            this.textValue = temp
        }
    }
}
