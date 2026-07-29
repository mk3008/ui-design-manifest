(function () {
  const shell = document.querySelector('.shared-shell');
  const drawerToggle = document.querySelector('[data-drawer-toggle]');
  const themeToggle = document.querySelector('[data-theme-toggle]');
  const themeIcon = document.querySelector('[data-theme-icon]');
  const form = document.querySelector('#customer-form');
  const errorSummary = document.querySelector('#error-summary');
  const params = new URLSearchParams(window.location.search);

  const fields = {
    name: { input: document.querySelector('#customer-name'), error: document.querySelector('#customer-name-error'), label: '氏名' },
    birthDate: { input: document.querySelector('#birth-date'), error: document.querySelector('#birth-date-error'), label: '生年月日' },
    address: { input: document.querySelector('#address'), error: document.querySelector('#address-error'), label: '住所' },
    phone: { input: document.querySelector('#phone'), error: document.querySelector('#phone-error'), label: '電話番号' },
    email: { input: document.querySelector('#email'), error: document.querySelector('#email-error'), label: 'メールアドレス' }
  };

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

  function isValidDate(value) {
    if (!/^\d{4}-\d{2}-\d{2}$/.test(value)) return false;
    const [year, month, day] = value.split('-').map(Number);
    const date = new Date(year, month - 1, day);
    return date.getFullYear() === year && date.getMonth() === month - 1 && date.getDate() === day;
  }

  function messageFor(name) {
    const value = fields[name].input.value.trim();
    if (!value) return `${fields[name].label}は必須です。`;
    if (name === 'birthDate' && !isValidDate(value)) return '生年月日は YYYY-MM-DD 形式の有効な日付で入力してください。';
    if (name === 'phone' && !/^[0-9()\s-]{6,20}$/.test(value) || name === 'phone' && !/\d/.test(value)) return '電話番号は数字、ハイフン、空白、括弧を使用して入力してください。';
    if (name === 'email' && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)) return 'メールアドレスの形式で入力してください。';
    return '';
  }

  function validateField(name) {
    const field = fields[name];
    const message = messageFor(name);
    field.error.textContent = message;
    field.input.setAttribute('aria-invalid', String(Boolean(message)));
    return message;
  }

  function validateForm() {
    const invalidFields = Object.keys(fields).filter((name) => validateField(name));
    errorSummary.hidden = invalidFields.length === 0;
    return invalidFields;
  }

  drawerToggle.addEventListener('click', function () {
    renderDrawer(shell.dataset.drawer === 'open' ? 'hidden' : 'open');
  });
  themeToggle.addEventListener('click', function () {
    renderTheme(shell.dataset.theme === 'light' ? 'dark' : 'light');
  });
  Object.keys(fields).forEach((name) => {
    fields[name].input.addEventListener('blur', () => validateField(name));
    fields[name].input.addEventListener('input', () => {
      if (fields[name].input.getAttribute('aria-invalid') === 'true') validateField(name);
    });
  });
  form.addEventListener('submit', function (event) {
    event.preventDefault();
    const invalidFields = validateForm();
    if (invalidFields.length) {
      errorSummary.focus();
      fields[invalidFields[0]].input.focus();
    }
  });

  renderDrawer(params.get('drawer') === 'hidden' ? 'hidden' : 'open');
  renderTheme(params.get('theme') === 'dark' ? 'dark' : 'light');
}());
