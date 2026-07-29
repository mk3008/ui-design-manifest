(function () {
  const shell = document.querySelector('.shared-shell');
  const drawerToggle = document.querySelector('[data-drawer-toggle]');
  const themeToggle = document.querySelector('[data-theme-toggle]');
  const themeIcon = document.querySelector('[data-theme-icon]');
  const form = document.querySelector('#customer-form');
  const summary = document.querySelector('#error-summary');
  const summaryList = document.querySelector('#error-summary-list');
  const params = new URLSearchParams(window.location.search);
  const fields = [
    { id: 'full-name', label: '氏名', validate: value => value.trim() ? '' : '氏名を入力してください。' },
    { id: 'birth-date', label: '生年月日', validate: validateDate },
    { id: 'address', label: '住所', validate: value => value.trim() ? '' : '住所を入力してください。' },
    { id: 'phone', label: '電話番号', validate: validatePhone },
    { id: 'email', label: 'メールアドレス', validate: validateEmail }
  ];

  function renderDrawer(state) { const open = state === 'open'; shell.dataset.drawer = state; drawerToggle.setAttribute('aria-expanded', String(open)); drawerToggle.setAttribute('aria-label', open ? 'Drawer を閉じる' : 'Drawer を開く'); }
  function renderTheme(theme) { const next = theme === 'light' ? 'dark' : 'light'; shell.dataset.theme = theme; themeToggle.setAttribute('aria-label', `${next === 'dark' ? 'ダーク' : 'ライト'}モードに切り替える`); themeIcon.textContent = theme === 'light' ? '◐' : '◑'; }
  function validateDate(value) { if (!value.trim()) return '生年月日を入力してください。'; const match = /^(\d{4})-(\d{2})-(\d{2})$/.exec(value); if (!match) return '生年月日は YYYY-MM-DD 形式で入力してください。'; const date = new Date(`${value}T00:00:00`); return date.getFullYear() === Number(match[1]) && date.getMonth() + 1 === Number(match[2]) && date.getDate() === Number(match[3]) ? '' : '有効な生年月日を入力してください。'; }
  function validatePhone(value) { if (!value.trim()) return '電話番号を入力してください。'; return /^\d{2,4}-\d{2,4}-\d{3,4}$/.test(value) ? '' : '電話番号はハイフンを含む形式で入力してください。'; }
  function validateEmail(value) { if (!value.trim()) return 'メールアドレスを入力してください。'; return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value) ? '' : 'メールアドレス形式で入力してください。'; }
  function setFieldError(field, message) { const input = document.querySelector(`#${field.id}`); const container = input.closest('.field'); const messageElement = document.querySelector(`#${field.id}-message`); container.classList.toggle('has-error', Boolean(message)); input.setAttribute('aria-invalid', String(Boolean(message))); messageElement.textContent = message || (messageElement.classList.contains('help') ? helpText(field.id) : ''); }
  function helpText(id) { return { 'birth-date': 'YYYY-MM-DD 形式で入力してください。', phone: 'ハイフンを含む電話番号形式で入力してください。', email: 'メールアドレス形式で入力してください。' }[id] || ''; }
  function validateForm() { const errors = fields.map(field => ({ field, message: field.validate(document.querySelector(`#${field.id}`).value) })).filter(result => result.message); fields.forEach(field => { const match = errors.find(error => error.field.id === field.id); setFieldError(field, match ? match.message : ''); }); return errors; }

  drawerToggle.addEventListener('click', () => renderDrawer(shell.dataset.drawer === 'open' ? 'hidden' : 'open'));
  themeToggle.addEventListener('click', () => renderTheme(shell.dataset.theme === 'light' ? 'dark' : 'light'));
  fields.forEach(field => document.querySelector(`#${field.id}`).addEventListener('blur', () => { const message = field.validate(document.querySelector(`#${field.id}`).value); setFieldError(field, message); }));
  form.addEventListener('submit', event => { event.preventDefault(); const errors = validateForm(); summaryList.replaceChildren(); if (!errors.length) { summary.hidden = true; return; } errors.forEach(({ field, message }) => { const item = document.createElement('li'); const link = document.createElement('a'); link.href = `#${field.id}`; link.textContent = `${field.label}: ${message}`; item.append(link); summaryList.append(item); }); summary.hidden = false; summary.focus(); });

  renderDrawer(params.get('drawer') === 'hidden' ? 'hidden' : 'open');
  renderTheme(params.get('theme') === 'dark' ? 'dark' : 'light');
}());
