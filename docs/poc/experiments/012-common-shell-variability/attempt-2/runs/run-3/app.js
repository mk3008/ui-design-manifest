(() => {
  const root = document.documentElement;
  const drawerToggle = document.querySelector('#drawer-toggle');
  const themeToggle = document.querySelector('#theme-toggle');
  const themeIcon = themeToggle.querySelector('.theme-icon');

  const validValue = (value, allowed, fallback) => allowed.includes(value) ? value : fallback;
  const parameters = new URLSearchParams(window.location.search);
  let drawer = validValue(parameters.get('drawer'), ['open', 'hidden'], 'open');
  let theme = validValue(parameters.get('theme'), ['light', 'dark'], 'light');

  const render = () => {
    root.dataset.drawer = drawer;
    root.dataset.theme = theme;
    drawerToggle.setAttribute('aria-expanded', String(drawer === 'open'));
    drawerToggle.setAttribute('aria-label', drawer === 'open' ? 'Drawer を閉じる' : 'Drawer を開く');
    themeToggle.setAttribute('aria-label', theme === 'light' ? 'ダークテーマに切り替える' : 'ライトテーマに切り替える');
    themeIcon.textContent = theme === 'light' ? '☾' : '☀';
  };

  drawerToggle.addEventListener('click', () => {
    drawer = drawer === 'open' ? 'hidden' : 'open';
    render();
  });

  themeToggle.addEventListener('click', () => {
    theme = theme === 'light' ? 'dark' : 'light';
    render();
  });

  render();
})();
