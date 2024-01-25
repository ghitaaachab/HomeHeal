// app/javascript/packs/search.js

document.addEventListener("turbolinks:load", () => {
  const searchButton = document.getElementById("search-button");

  if (searchButton) {
    searchButton.addEventListener("click", () => {
      const searchTerm = document.getElementById("form1").value.trim();

      if (searchTerm) {
        // Redirect to the listing page with the search term as a parameter
        Turbolinks.visit(`/listings/search?query=${encodeURIComponent(searchTerm)}`);
      }
    });
  }
});
