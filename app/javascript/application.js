// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", () => {
  document.addEventListener("click", (event) => {
    if (event.target.matches(".edit-button")) {
      window.scrollTo({ top: 0, behavior: "smooth" });
    }
  });
});
