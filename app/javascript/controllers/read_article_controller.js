import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["articleId", "menu"];

  markAsRead() {
    console.log("click")
    const articleId = this.data.get("articleId")
    // const articleId = this.articleIdTarget.getAttribute("data-article-id");

    // Make an AJAX request to mark the article as read
    fetch(`/mark_as_read/${articleId}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
    })
      .then((response) => response.json())
      .then((data) => {
        // Handle the response as needed
        console.log(data);

        const svg = this.element.querySelector('svg.read');

        if(data["status"] == "success"){
          if(data["type"] == "unread"){
            svg.querySelector('path').setAttribute('d', 'M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z');
          } else if(data["type"] == "read") {
            svg.querySelector('path').setAttribute('d', 'M8.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L2.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093L8.95 4.992a.252.252 0 0 1 .02-.022zm-.92 5.14.92.92a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 1 0-1.091-1.028L9.477 9.417l-.485-.486-.943 1.179z');
          }
        }
      });
  }

  markAsReadLater() {
    console.log("click")
    const articleId = this.data.get("articleId")
    // const articleId = this.articleIdTarget.getAttribute("data-article-id");

    // Make an AJAX request to mark the article as read
    fetch(`/mark_as_read_later/${articleId}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
    })
      .then((response) => response.json())
      .then((data) => {
        // Handle the response as needed
        console.log(data);

        const svg = this.element.querySelector('svg.bookmark');

        if(data["status"] == "success"){
          if(data["type"] == "no_read_later"){
            svg.querySelector('path').setAttribute('d', 'M16 2.929H8a2.5 2.5 0 0 0-2.5 2.5v16l.007.084a.5.5 0 0 0 .723.36l5.777-2.998 5.762 2.997a.5.5 0 0 0 .731-.443v-16a2.5 2.5 0 0 0-2.5-2.5Zm0 1 .144.006A1.5 1.5 0 0 1 17.5 5.43v15.176l-5.261-2.737-.09-.036a.5.5 0 0 0-.371.036L6.5 20.606V5.429a1.5 1.5 0 0 1 1.5-1.5h8Z');
          } else if(data["type"] == "read_later") {
            svg.querySelector('path').setAttribute('d', 'M15.692 3H8.308C7.033 3 6 4.06 6 5.368v15.158l.006.08a.46.46 0 0 0 .668.34l5.332-2.84 5.32 2.84a.462.462 0 0 0 .674-.42V5.368C18 4.06 16.967 3 15.692 3Z');
          }
        }
      });
  }

  openDropdown() {
    console.log("open dp")
    this.menuTarget.style.display = "block";
  }

  selectBoard(event) {
    console.log("select")
    event.preventDefault();
    const boardId = event.currentTarget.dataset.boardId;
    const articleId = event.currentTarget.dataset.articleId;
    // Handle board selection as needed
    console.log(`Selected board with ID ${boardId}`);
    fetch(`/add_to_board/${articleId}/${boardId}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
    })
      .then((response) => response.json())
      .then((data) => {
        // Handle the response as needed
        console.log(data);
      });
    // Close the dropdown
    this.menuTarget.style.display = "none";
  }

  shareFacebook(event){
    console.log('share');
    event.preventDefault();
    const articleId = this.data.get("articleId");
    var articleUrl = `localhost:3000/articles/${articleId}`;
    console.log(articleUrl);

    // Open the Facebook Share Dialog
    FB.ui({
      method: 'share',
      href: articleUrl,
    }, function(response){});
  }
}
