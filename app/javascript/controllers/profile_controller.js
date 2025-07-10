import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "bioForm", "editBio", "bio", "avatarForm", "editAvatar", ]
    static classes = [ "hide" ]
  connect() {
    if (this.hasBioFormTarget) {
        this.bioFormTarget.classList.toggle(this.hideClass)
    }

    if (this.hasAvatarFormTarget) {
        this.avatarFormTarget.classList.toggle(this.hideClass)
    }
  }

  toggleBioTargets() {
    if (this.hasBioFormTarget) {
        this.bioFormTarget.classList.toggle(this.hideClass)
    }
    if (this.hasBioTarget && this.hasEditBioTarget) {
        this.bioTarget.classList.toggle(this.hideClass)
        this.editBioTarget.classList.toggle(this.hideClass)
    }
  }

  toggleAvatarTargets() {
    if (this.hasAvatarFormTarget) {
      this.avatarFormTarget.classList.toggle(this.hideClass)
    }
    if (this.hasEditAvatarTarget) {
      this.editAvatarTarget.classList.toggle(this.hideClass)
    }
  }
}
