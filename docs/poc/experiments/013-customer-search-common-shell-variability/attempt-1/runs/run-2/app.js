(function () {
  const shell = document.querySelector('.shared-shell');
  const drawerToggle = document.querySelector('[data-drawer-toggle]');
  const themeToggle = document.querySelector('[data-theme-toggle]');
  const themeIcon = document.querySelector('[data-theme-icon]');
  const form = document.querySelector('#customer-search-form');
  const count = document.querySelector('#result-count');
  const rows = Array.from(document.querySelectorAll('#customer-results tr'));
  const params = new URLSearchParams(window.location.search);

  const requestedDrawer = params.get('drawer');
  const requestedTheme = params.get('theme');
  const initialDrawer = requestedDrawer === 'hidden' ? 'hidden' : 'open';
  const initialTheme = requestedTheme === 'dark' ? 'dark' : 'light';

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

  function normalize(value) {
    return value.trim().toLocaleLowerCase('ja-JP');
  }

  function applySearch() {
    const fields = new FormData(form);
    const query = Object.fromEntries(Array.from(fields, ([key, value]) => [key, normalize(String(value))]));
    let visibleCount = 0;

    rows.forEach(function (row) {
      const matches = Object.entries(query).every(function ([key, value]) {
        return !value || normalize(row.dataset[key]).includes(value);
      });
      row.hidden = !matches;
      if (matches) visibleCount += 1;
    });

    count.textContent = `${visibleCount}件`;
  }

  drawerToggle.addEventListener('click', function () {
    renderDrawer(shell.dataset.drawer === 'open' ? 'hidden' : 'open');
  });

  themeToggle.addEventListener('click', function () {
    renderTheme(shell.dataset.theme === 'light' ? 'dark' : 'light');
  });

  form.addEventListener('submit', function (event) {
    event.preventDefault();
    applySearch();
  });

  form.addEventListener('reset', function () {
    window.setTimeout(applySearch, 0);
  });

  renderDrawer(initialDrawer);
  renderTheme(initialTheme);
}());
