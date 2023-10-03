import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "content"];

  openModal() {
    this.modalTarget.classList.add("open");
  }

  closeModal() {
    this.modalTarget.classList.remove("open");
  }
}