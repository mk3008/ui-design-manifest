(() => {
  const shell = document.querySelector('.shell');
  const drawerToggle = document.querySelector('[data-drawer-toggle]');
  const themeToggle = document.querySelector('[data-theme-toggle]');
  const themeIcon = document.querySelector('[data-theme-icon]');

  const initialDrawer = new URLSearchParams(window.location.search).get('drawer');
  const initialTheme = new URLSearchParams(window.location.search).get('theme');

  function updateUrl() {
    const parameters = new URLSearchParams(window.location.search);
    parameters.set('drawer', shell.dataset.drawer);
    parameters.set('theme', shell.dataset.theme);
    window.history.replaceState(null, '', `${window.location.pathname}?${parameters.toString()}`);
  }

  function renderDrawer() {
    const isOpen = shell.dataset.drawer === 'open';
    drawerToggle.setAttribute('aria-expanded', String(isOpen));
    drawerToggle.setAttribute('aria-label', isOpen ? 'Drawer を閉じる' : 'Drawer を開く');
  }

  function renderTheme() {
    const isLight = shell.dataset.theme === 'light';
    themeToggle.setAttribute('aria-label', isLight ? 'ダークテーマに切り替える' : 'ライトテーマに切り替える');
    themeIcon.textContent = isLight ? '☾' : '☀';
  }

  shell.dataset.drawer = initialDrawer === 'hidden' ? 'hidden' : 'open';
  shell.dataset.theme = initialTheme === 'dark' ? 'dark' : 'light';
  renderDrawer();
  renderTheme();

  drawerToggle.addEventListener('click', () => {
    shell.dataset.drawer = shell.dataset.drawer === 'open' ? 'hidden' : 'open';
    renderDrawer();
    updateUrl();
  });

  themeToggle.addEventListener('click', () => {
    shell.dataset.theme = shell.dataset.theme === 'light' ? 'dark' : 'light';
    renderTheme();
    updateUrl();
  });
})();
