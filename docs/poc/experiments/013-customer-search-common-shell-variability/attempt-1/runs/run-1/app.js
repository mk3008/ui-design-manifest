(function () {
  const shell = document.querySelector('.shared-shell');
  const drawerToggle = document.querySelector('[data-drawer-toggle]');
  const themeToggle = document.querySelector('[data-theme-toggle]');
  const themeIcon = document.querySelector('[data-theme-icon]');
  const searchForm = document.querySelector('[data-search-form]');
  const customers = Array.from(document.querySelectorAll('[data-customer]'));
  const resultCount = document.querySelector('[data-result-count]');
  const emptyMessage = document.querySelector('[data-empty-message]');
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

  function matches(customer, criteria) {
    return Object.entries(criteria).every(function ([key, value]) {
      return !value || customer.dataset[key].toLowerCase().includes(value.toLowerCase());
    });
  }

  function renderResults() {
    const formData = new FormData(searchForm);
    const criteria = Object.fromEntries(formData.entries());
    let visibleCount = 0;

    customers.forEach(function (customer) {
      const visible = matches(customer, criteria);
      customer.hidden = !visible;
      if (visible) visibleCount += 1;
    });

    resultCount.textContent = `${visibleCount}件`;
    emptyMessage.hidden = visibleCount !== 0;
  }

  drawerToggle.addEventListener('click', function () {
    renderDrawer(shell.dataset.drawer === 'open' ? 'hidden' : 'open');
  });

  themeToggle.addEventListener('click', function () {
    renderTheme(shell.dataset.theme === 'light' ? 'dark' : 'light');
  });

  searchForm.addEventListener('submit', function (event) {
    event.preventDefault();
    renderResults();
  });

  searchForm.addEventListener('reset', function () {
    window.setTimeout(renderResults, 0);
  });

  renderDrawer(initialDrawer);
  renderTheme(initialTheme);
  renderResults();
}());
