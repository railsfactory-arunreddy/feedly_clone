import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['article'];

  markAsRead() {
    console.log("Hello")
    console.log(this.articleTarget)
    const articleId = this.articleTarget.dataset.articleId;

    // Make an AJAX request to mark the article as read
    fetch(`/mark_as_read/${articleId}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': Rails.csrfToken(),
      },
    })
      .then((response) => response.json())
      .then((data) => {
        // Handle the response as needed
        console.log(data);
      });
  }
}
