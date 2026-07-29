(function () {
  const shell = document.querySelector('.shared-shell');
  const drawerToggle = document.querySelector('[data-drawer-toggle]');
  const themeToggle = document.querySelector('[data-theme-toggle]');
  const themeIcon = document.querySelector('[data-theme-icon]');
  const message = document.querySelector('[data-live-message]');
  const searchForm = document.querySelector('[data-search-form]');
  const params = new URLSearchParams(window.location.search);

  function renderDrawer(state) { const open = state === 'open'; shell.dataset.drawer = state; drawerToggle.setAttribute('aria-expanded', String(open)); drawerToggle.setAttribute('aria-label', open ? 'Drawer を閉じる' : 'Drawer を開く'); }
  function renderTheme(theme) { const next = theme === 'light' ? 'dark' : 'light'; shell.dataset.theme = theme; themeToggle.setAttribute('aria-label', `${next === 'dark' ? 'ダーク' : 'ライト'}モードに切り替える`); themeIcon.textContent = theme === 'light' ? '◐' : '◑'; }
  function showStaticMessage(label) { message.textContent = `${label}は利用できますが、この静的な画面では結果や画面遷移を実装していません。`; }

  drawerToggle.addEventListener('click', () => renderDrawer(shell.dataset.drawer === 'open' ? 'hidden' : 'open'));
  themeToggle.addEventListener('click', () => renderTheme(shell.dataset.theme === 'light' ? 'dark' : 'light'));
  searchForm.addEventListener('submit', event => { event.preventDefault(); showStaticMessage('検索'); });
  searchForm.addEventListener('reset', () => { window.setTimeout(() => { message.textContent = '検索条件をリセットしました。検索結果は固定の6件です。'; }, 0); });
  document.querySelector('[data-add-customer]').addEventListener('click', () => showStaticMessage('顧客の追加'));
  document.querySelectorAll('[data-customer]').forEach(button => button.addEventListener('click', () => showStaticMessage(`${button.dataset.customer} の詳細確認`)));

  renderDrawer(params.get('drawer') === 'hidden' ? 'hidden' : 'open');
  renderTheme(params.get('theme') === 'dark' ? 'dark' : 'light');
}());
