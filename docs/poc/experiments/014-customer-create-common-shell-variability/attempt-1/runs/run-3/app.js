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

  function validateDate(value) {
    if (!value.trim()) return '生年月日を入力してください。';
    if (!/^\d{4}-\d{2}-\d{2}$/.test(value)) return '生年月日は YYYY-MM-DD 形式で入力してください。';
    const [year, month, day] = value.split('-').map(Number);
    const date = new Date(year, month - 1, day);
    return date.getFullYear() === year && date.getMonth() === month - 1 && date.getDate() === day ? '' : '有効な生年月日を入力してください。';
  }

  function validatePhone(value) {
    if (!value.trim()) return '電話番号を入力してください。';
    return /^[0-9][0-9 -]{7,18}$/.test(value) && /\d/.test(value) ? '' : '電話番号は数字、ハイフン、半角スペースで入力してください。';
  }

  function validateEmail(value) {
    if (!value.trim()) return 'メールアドレスを入力してください。';
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value) ? '' : 'メールアドレスの形式で入力してください。';
  }

  function setFieldError(field, message) {
    const input = document.querySelector(`#${field.id}`);
    const error = document.querySelector(`#${field.id}-error`);
    error.textContent = message;
    input.setAttribute('aria-invalid', message ? 'true' : 'false');
  }

  function validateForm() {
    const errors = fields.map(field => ({ field, message: field.validate(document.querySelector(`#${field.id}`).value) })).filter(result => result.message);
    fields.forEach(field => {
      const match = errors.find(result => result.field.id === field.id);
      setFieldError(field, match ? match.message : '');
    });
    return errors;
  }

  function renderErrors(errors) {
    summaryList.replaceChildren();
    if (!errors.length) {
      summary.hidden = true;
      return;
    }
    errors.forEach(({ field, message }) => {
      const item = document.createElement('li');
      const link = document.createElement('a');
      link.href = `#${field.id}`;
      link.textContent = `${field.label}: ${message}`;
      link.addEventListener('click', event => {
        event.preventDefault();
        document.querySelector(`#${field.id}`).focus();
      });
      item.append(link);
      summaryList.append(item);
    });
    summary.hidden = false;
    summary.focus();
  }

  drawerToggle.addEventListener('click', () => renderDrawer(shell.dataset.drawer === 'open' ? 'hidden' : 'open'));
  themeToggle.addEventListener('click', () => renderTheme(shell.dataset.theme === 'light' ? 'dark' : 'light'));
  form.addEventListener('submit', event => {
    event.preventDefault();
    renderErrors(validateForm());
  });
  fields.forEach(field => document.querySelector(`#${field.id}`).addEventListener('blur', () => {
    const message = field.validate(document.querySelector(`#${field.id}`).value);
    setFieldError(field, message);
  }));

  renderDrawer(params.get('drawer') === 'hidden' ? 'hidden' : 'open');
  renderTheme(params.get('theme') === 'dark' ? 'dark' : 'light');
}());
