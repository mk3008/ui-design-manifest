(() => {
  const gridScroll = document.querySelector('.grid-scroll');

  if (!gridScroll) return;

  const updatePinnedColumnState = () => {
    gridScroll.classList.toggle('is-scrolled', gridScroll.scrollLeft > 0);
  };

  gridScroll.addEventListener('scroll', updatePinnedColumnState, { passive: true });
  updatePinnedColumnState();
})();
