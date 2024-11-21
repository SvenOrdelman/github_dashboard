import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "form"]

  showForm() {
    this.buttonTarget.classList.add("hidden")
    this.formTarget.classList.remove("hidden")
  }

  connect() {
    this.formTarget.addEventListener("keydown", (e) => {
      if (e.key === "Enter") {
        e.preventDefault()
        this.formTarget.querySelector("form").requestSubmit()
      }
    });

    
    document.addEventListener("keydown", (e) => {
      if (e.key === "Escape") {
        e.preventDefault()
        this.formTarget.classList.add("hidden")
        this.buttonTarget.classList.remove("hidden")
      }
    });
  }
}
