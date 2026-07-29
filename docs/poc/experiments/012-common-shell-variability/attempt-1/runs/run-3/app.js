(() => {
  const shell = document.getElementById('app-shell');
  const toggle = document.getElementById('drawer-toggle');
  const queryState = new URLSearchParams(window.location.search).get('drawer');
  let isOpen = queryState !== 'hidden';

  function render() {
    shell.classList.toggle('drawer-hidden', !isOpen);
    toggle.setAttribute('aria-expanded', String(isOpen));
    toggle.setAttribute('aria-label', isOpen ? 'ナビゲーションを閉じる' : 'ナビゲーションを開く');
  }

  toggle.addEventListener('click', () => {
    isOpen = !isOpen;
    render();
  });

  render();
})();
