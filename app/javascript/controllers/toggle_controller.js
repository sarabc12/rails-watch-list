import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["form", "labelName", "labelDescription", "inputName", "inputDescription"]
  fire() {
    this.formTarget.classList.toggle("d-none")
  }

  blurName() {
    this.labelNameTarget.classList.add("focused-label")
    console.log(this.inputNameTarget.value == "")
    if (this.inputNameTarget.value == "") {
      this.labelNameTarget.classList.remove("floating-label")
    };
  }

  blurDescription() {
    this.labelDescriptionTarget.classList.add("focused-label")
    if (this.inputDescriptionTarget.value == "") {
      this.labelDescriptionTarget.classList.remove("floating-label")
    };
  }

  transitionName() {
    this.labelNameTarget.classList.remove("focused-label")
    this.labelNameTarget.classList.add("floating-label")
  }

  transitionDescription() {
    this.labelDescriptionTarget.classList.remove("focused-label")
    this.labelDescriptionTarget.classList.add("floating-label")
  }
}
