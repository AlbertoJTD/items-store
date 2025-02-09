import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="websockets--product"
export default class extends Controller {
  connect() {
    createConsumer().subscriptions.create({ channel: "ProductChannel", room: this.element.dataset.productid }, {
      received(data) {
        if (data.message === "Product updated") {
          location.reload();
        }
      }
    });
  }
}
