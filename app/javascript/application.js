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

// Create new p tag and br tag instead of div in Trix editor
Trix.config.blockAttributes.default.tagName = "p"
Trix.config.blockAttributes.default.breakOnReturn = true

// Create new buttons for adding h2, h3 and underline text
Trix.config.blockAttributes.heading2 = {
  tagName: 'h2'
}
Trix.config.blockAttributes.heading3 = {
  tagName: 'h3'
}
Trix.config.textAttributes.underline = {
  tagName: 'u'
}

 // insert the buttons visual in the default toolbar
addEventListener("trix-initialize", function(event) {
  var h2button = '<button type="button" class="trix-button" data-trix-attribute="heading2" title="h2" tabindex="-1">H2</button>'

  event.target.toolbarElement.
  querySelector(".trix-button-group").
  insertAdjacentHTML("beforeend", h2button)
})

addEventListener("trix-initialize", function(event) {
  var h3button = '<button type="button" class="trix-button" data-trix-attribute="heading3" title="h3" tabindex="-1">H3</button>'

  event.target.toolbarElement.
  querySelector(".trix-button-group").
  insertAdjacentHTML("beforeend", h3button)
})

addEventListener("trix-initialize", function(event) {
  var ubutton = '<button type="button" class="trix-button" data-trix-attribute="underline" title="u" tabindex="-1">u</button>'

  event.target.toolbarElement.
  querySelector(".trix-button-group").
  insertAdjacentHTML("beforeend", ubutton)
})
