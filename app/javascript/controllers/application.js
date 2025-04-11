import { Application } from "@hotwired/stimulus"
import ReadMore from "https://cdn.jsdelivr.net/npm/@stimulus-components/read-more/+esm"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application
application.register('read-more', ReadMore)

export { application }
