import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="stop-refresh"
export default class extends Controller {
  connect() {
    console.log("hello")
  }

  stop(event) {
    event.preventDefault()
  }
}
