(() => {
  const shell = document.querySelector('.shell');
  const drawerToggle = document.querySelector('[data-drawer-toggle]');
  const themeToggle = document.querySelector('[data-theme-toggle]');
  const themeIcon = document.querySelector('[data-theme-icon]');

  const validDrawer = new Set(['open', 'hidden']);
  const validTheme = new Set(['light', 'dark']);

  function updateUrl(drawer, theme) {
    const url = new URL(window.location.href);
    url.searchParams.set('drawer', drawer);
    url.searchParams.set('theme', theme);
    window.history.replaceState(null, '', url);
  }

  function render(drawer, theme, writeUrl = false) {
    shell.dataset.drawer = drawer;
    shell.dataset.theme = theme;

    const drawerOpen = drawer === 'open';
    drawerToggle.setAttribute('aria-expanded', String(drawerOpen));
    drawerToggle.setAttribute('aria-label', drawerOpen ? 'Drawer を閉じる' : 'Drawer を開く');

    const nextTheme = theme === 'light' ? 'dark' : 'light';
    themeToggle.setAttribute('aria-label', `${nextTheme === 'dark' ? 'ダーク' : 'ライト'}テーマに切り替える`);
    themeIcon.textContent = nextTheme === 'dark' ? '☾' : '☼';

    if (writeUrl) updateUrl(drawer, theme);
  }

  const params = new URLSearchParams(window.location.search);
  const initialDrawer = validDrawer.has(params.get('drawer')) ? params.get('drawer') : 'open';
  const initialTheme = validTheme.has(params.get('theme')) ? params.get('theme') : 'light';
  render(initialDrawer, initialTheme);

  drawerToggle.addEventListener('click', () => {
    const nextDrawer = shell.dataset.drawer === 'open' ? 'hidden' : 'open';
    render(nextDrawer, shell.dataset.theme, true);
  });

  themeToggle.addEventListener('click', () => {
    const nextTheme = shell.dataset.theme === 'light' ? 'dark' : 'light';
    render(shell.dataset.drawer, nextTheme, true);
  });
})();
