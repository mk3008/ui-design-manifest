(function () {
  const form = document.querySelector('#customer-search-form');
  const grid = document.querySelector('[data-result-grid]');

  if (form) {
    form.addEventListener('submit', function (event) {
      event.preventDefault();
    });
  }

  if (!grid) return;

  function updateScrollState() {
    grid.classList.toggle('is-scrolled', grid.scrollLeft > 0);
  }

  grid.addEventListener('scroll', updateScrollState, { passive: true });
  updateScrollState();
}());
