import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.startRefreshing()
  }

  disconnect() {
    this.stopRefreshing() 
  }

  async refresh() {
    await new Promise(resolve => setTimeout(resolve, 3000));
    this.element.closest('turbo-frame').src = this.element.dataset.refreshUrl;
  }

  startRefreshing() {
    this.refreshTimer = setInterval(() => {
      this.refresh();
    }, 30000)
  }

  stopRefreshing() {
    if (this.refreshTimer) {
      clearInterval(this.refreshTimer)
    }
  }
}
