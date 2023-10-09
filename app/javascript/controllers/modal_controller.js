import { Controller } from "@hotwired/stimulus"
import * as bootstrap from "bootstrap"

export default class extends Controller {
  connect() {
    console.log("here")
    this.modal = new bootstrap.Modal(this.element)
  }

  openModal() {
    console.log("open")
    if (!this.modal.isOpened) {
      this.modal.show()
    }
  }

  closeModal(event) {
    console.log("close")
    this.modal.hide()
  }
}