// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"

// Open all external links in a new window
addEventListener("click", function(event) {
  var el = event.target

  if (el.tagName === "A" && !el.isContentEditable && el.host !== window.location.host) {
    el.setAttribute("target", "_blank")
  }
}, true)
