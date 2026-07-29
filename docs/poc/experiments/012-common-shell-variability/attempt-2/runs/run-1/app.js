(() => {
  const appShell = document.querySelector('#app-shell');
  const drawerToggle = document.querySelector('#drawer-toggle');
  const themeToggle = document.querySelector('#theme-toggle');
  const themeIcon = document.querySelector('#theme-icon');

  const parameters = new URLSearchParams(window.location.search);
  let drawerOpen = parameters.get('drawer') !== 'hidden';
  let theme = parameters.get('theme') === 'dark' ? 'dark' : 'light';

  function setDrawerState(isOpen) {
    drawerOpen = isOpen;
    appShell.classList.toggle('drawer-is-hidden', !drawerOpen);
    drawerToggle.setAttribute('aria-expanded', String(drawerOpen));
    drawerToggle.setAttribute('aria-label', drawerOpen ? 'Drawer を閉じる' : 'Drawer を開く');
  }

  function setTheme(selectedTheme) {
    theme = selectedTheme;
    appShell.dataset.theme = theme;
    const upcomingTheme = theme === 'light' ? 'dark' : 'light';
    themeToggle.setAttribute('aria-label', `${upcomingTheme === 'dark' ? 'ダーク' : 'ライト'}テーマに切り替える`);
    themeIcon.textContent = theme === 'light' ? '☼' : '☾';
  }

  drawerToggle.addEventListener('click', () => setDrawerState(!drawerOpen));
  themeToggle.addEventListener('click', () => setTheme(theme === 'light' ? 'dark' : 'light'));

  setDrawerState(drawerOpen);
  setTheme(theme);
})();
