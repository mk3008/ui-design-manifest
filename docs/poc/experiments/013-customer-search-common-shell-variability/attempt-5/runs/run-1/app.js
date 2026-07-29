(function () {
  const shell = document.querySelector('.shared-shell');
  const drawerToggle = document.querySelector('[data-drawer-toggle]');
  const themeToggle = document.querySelector('[data-theme-toggle]');
  const themeIcon = document.querySelector('[data-theme-icon]');
  const notice = document.querySelector('[data-interaction-note]');
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
  function note(message) { notice.textContent = message; }

  drawerToggle.addEventListener('click', () => renderDrawer(shell.dataset.drawer === 'open' ? 'hidden' : 'open'));
  themeToggle.addEventListener('click', () => renderTheme(shell.dataset.theme === 'light' ? 'dark' : 'light'));
  document.querySelector('[data-search-form]').addEventListener('submit', (event) => { event.preventDefault(); note('検索実行はこの静的実験では結果に反映されません。'); });
  document.querySelector('[data-search-form]').addEventListener('reset', () => note('検索条件をリセットしました。'));
  document.querySelector('[data-add-customer]').addEventListener('click', () => note('顧客追加はこの静的実験では遷移しません。'));
  document.querySelectorAll('[data-customer-id]').forEach((button) => button.addEventListener('click', () => note(`顧客ID ${button.dataset.customerId} の詳細確認はこの静的実験では遷移しません。`)));
  document.querySelector('[data-pagination-next]').addEventListener('click', () => note('ページングは利用可能な操作として表示しています。実際のページ移動は実装していません。'));

  renderDrawer(params.get('drawer') === 'hidden' ? 'hidden' : 'open');
  renderTheme(params.get('theme') === 'dark' ? 'dark' : 'light');
}());
