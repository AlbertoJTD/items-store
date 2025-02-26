import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["sidebar"];

  connect() {
    setTimeout(() => {
      this.sidebarTarget.classList.replace("translate-x-full", "translate-x-0");
    }, 50);

    this.element.addEventListener("turbo:submit-end", (event) => {
      if (event.detail.success) {
        Turbo.visit(event.detail.fetchResponse.response.url);
      }
    });
  }

  close() {
    this.sidebarTarget.classList.replace("translate-x-0", "translate-x-full");

    setTimeout(() => {
      this.element.parentElement.removeAttribute("src");
      this.element.remove();
    }, 250);
  }
}
