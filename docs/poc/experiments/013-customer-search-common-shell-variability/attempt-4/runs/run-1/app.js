(function () {
  const shell = document.querySelector('.shared-shell');
  const drawerToggle = document.querySelector('[data-drawer-toggle]');
  const themeToggle = document.querySelector('[data-theme-toggle]');
  const themeIcon = document.querySelector('[data-theme-icon]');
  const message = document.querySelector('[data-live-message]');
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

  drawerToggle.addEventListener('click', () => renderDrawer(shell.dataset.drawer === 'open' ? 'hidden' : 'open'));
  themeToggle.addEventListener('click', () => renderTheme(shell.dataset.theme === 'light' ? 'dark' : 'light'));
  document.querySelector('[data-search-form]').addEventListener('submit', (event) => { event.preventDefault(); message.textContent = '検索条件を受け付けました。表示中の結果は静的な fixture です。'; });
  document.querySelector('[data-search-form]').addEventListener('reset', () => { message.textContent = '検索条件をリセットしました。'; });
  document.querySelector('[data-add-customer]').addEventListener('click', () => { message.textContent = '顧客の追加画面への遷移は、この静的サンプルでは実装していません。'; });
  document.querySelectorAll('[data-customer-id]').forEach((button) => button.addEventListener('click', () => { message.textContent = `${button.dataset.customerId} の詳細確認は、この静的サンプルでは実装していません。`; }));
  renderDrawer(params.get('drawer') === 'hidden' ? 'hidden' : 'open');
  renderTheme(params.get('theme') === 'dark' ? 'dark' : 'light');
}());
