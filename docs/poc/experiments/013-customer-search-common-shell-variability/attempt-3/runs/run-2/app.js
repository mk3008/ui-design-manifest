(function () {
  const shell = document.querySelector('.shared-shell');
  const drawerToggle = document.querySelector('[data-drawer-toggle]');
  const themeToggle = document.querySelector('[data-theme-toggle]');
  const themeIcon = document.querySelector('[data-theme-icon]');
  const form = document.querySelector('#customer-search');
  const count = document.querySelector('#result-count');
  const rows = Array.from(document.querySelectorAll('#customer-rows tr'));
  const params = new URLSearchParams(window.location.search);

  function renderDrawer(state) {
    const isOpen = state === 'open';
    shell.dataset.drawer = state;
    drawerToggle.setAttribute('aria-expanded', String(isOpen));
    drawerToggle.setAttribute('aria-label', isOpen ? 'Drawer を閉じる' : 'Drawer を開く');
  }

  function renderTheme(theme) {
    const nextTheme = theme === 'light' ? 'dark' : 'light';
    shell.dataset.theme = theme;
    themeToggle.setAttribute('aria-label', `${nextTheme === 'dark' ? 'ダーク' : 'ライト'}モードに切り替える`);
    themeIcon.textContent = theme === 'light' ? '◐' : '◑';
  }

  function filterRows() {
    const values = Object.fromEntries(new FormData(form).entries());
    let visible = 0;
    rows.forEach(function (row) {
      const matches = Object.entries(values).every(function ([key, value]) {
        return !value || row.dataset[key].toLowerCase().includes(value.toLowerCase());
      });
      row.hidden = !matches;
      if (matches) visible += 1;
    });
    count.textContent = `${visible}件`;
  }

  drawerToggle.addEventListener('click', function () { renderDrawer(shell.dataset.drawer === 'open' ? 'hidden' : 'open'); });
  themeToggle.addEventListener('click', function () { renderTheme(shell.dataset.theme === 'light' ? 'dark' : 'light'); });
  form.addEventListener('submit', function (event) { event.preventDefault(); filterRows(); });
  form.addEventListener('reset', function () { window.setTimeout(filterRows, 0); });
  document.querySelectorAll('table a').forEach(function (link) { link.addEventListener('click', function (event) { event.preventDefault(); }); });

  renderDrawer(params.get('drawer') === 'hidden' ? 'hidden' : 'open');
  renderTheme(params.get('theme') === 'dark' ? 'dark' : 'light');
}());
