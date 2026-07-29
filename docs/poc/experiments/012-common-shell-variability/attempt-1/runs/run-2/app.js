(function () {
  const shell = document.getElementById('shell');
  const toggle = document.getElementById('drawer-toggle');
  const drawer = document.getElementById('drawer');

  function setDrawer(open) {
    shell.classList.toggle('drawer-hidden', !open);
    toggle.setAttribute('aria-expanded', String(open));
    drawer.setAttribute('aria-hidden', String(!open));
    const url = new URL(window.location.href);
    url.searchParams.set('drawer', open ? 'open' : 'hidden');
    window.history.replaceState({}, '', url);
  }

  const initialState = new URLSearchParams(window.location.search).get('drawer');
  setDrawer(initialState !== 'hidden');
  toggle.addEventListener('click', function () {
    setDrawer(shell.classList.contains('drawer-hidden'));
  });
}());
