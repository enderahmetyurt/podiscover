import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="infinite-scroll"
export default class extends Controller {

  initialize() {
    this.observer = new IntersectionObserver(entries => this.callback(entries))
  }

  connect() {
    this.observer.observe(this.element)
  }

  disconnect() {
    this.observer.unobserve(this.element)
  }

  callback(entries, _observer) {
    entries.forEach(entry => {
      if (!entry.isIntersecting) return

      fetch(this.element.href, {
        headers: {
          Accept: "text/vnd.turbo-stream.html"
        }
      })
        .then(r => r.text())
        .then(html => Turbo.renderStreamMessage(html))
        .then(_ => history.replaceState(history.state, "", this.element.href))
    })
  }
}