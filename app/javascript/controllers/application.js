import "controllers"
import { Application } from "@hotwired/stimulus"
import Reveal from 'stimulus-reveal-controller'

const application = Application.start()
application.register('reveal', Reveal)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
