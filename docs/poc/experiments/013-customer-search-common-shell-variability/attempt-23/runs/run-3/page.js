(function () {
  const grid = document.querySelector('[data-result-grid]');
  const searchForm = document.querySelector('[data-search-form]');

  if (grid) {
    const updateScrollState = function () {
      grid.classList.toggle('is-scrolled', grid.scrollLeft > 0);
    };

    grid.addEventListener('scroll', updateScrollState, { passive: true });
    updateScrollState();
  }

  if (searchForm) {
    searchForm.addEventListener('submit', function (event) {
      event.preventDefault();
    });
  }
}());
