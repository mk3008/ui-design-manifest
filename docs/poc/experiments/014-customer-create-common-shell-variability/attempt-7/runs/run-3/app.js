(function () {
  const shell = document.querySelector('.shared-shell');
  const drawerToggle = document.querySelector('[data-drawer-toggle]');
  const themeToggle = document.querySelector('[data-theme-toggle]');
  const themeIcon = document.querySelector('[data-theme-icon]');
  const form = document.querySelector('#customer-form');
  const errorSummary = document.querySelector('#error-summary');
  const errorSummaryList = document.querySelector('#error-summary-list');
  const params = new URLSearchParams(window.location.search);

  const fields = {
    fullName: { element: document.querySelector('#full-name'), label: '氏名', required: true },
    birthDate: { element: document.querySelector('#birth-date'), label: '生年月日', required: true, help: '生年月日はYYYY-MM-DD形式で入力してください。' },
    address: { element: document.querySelector('#address'), label: '住所', required: true },
    phoneNumber: { element: document.querySelector('#phone-number'), label: '電話番号', required: true, help: '電話番号は半角数字とハイフンを使用して入力してください。' },
    email: { element: document.querySelector('#email'), label: 'メールアドレス', required: true, help: 'メールアドレスはexample@example.com形式で入力してください。' },
    notes: { element: document.querySelector('#notes'), label: '備考', required: false }
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

  function validationMessage(name, value) {
    const field = fields[name];
    if (field.required && !value.trim()) return `${field.label}は必須です。`;
    if (!value.trim()) return '';
    if (name === 'birthDate' && !isValidDate(value)) return '生年月日はYYYY-MM-DD形式で入力してください。';
    if (name === 'phoneNumber' && !/^\d{2,4}-\d{2,4}-\d{3,4}$/.test(value)) return '電話番号は半角数字とハイフンを使用して入力してください。';
    if (name === 'email' && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)) return 'メールアドレスはexample@example.com形式で入力してください。';
    return '';
  }

  function renderField(name) {
    const field = fields[name];
    const message = validationMessage(name, field.element.value);
    const messageElement = document.querySelector(`#${field.element.id}-message`);
    field.element.setAttribute('aria-invalid', String(Boolean(message)));
    messageElement.textContent = message || field.help || '';
    messageElement.classList.toggle('is-error', Boolean(message));
    return message;
  }

  function renderSummary(errors) {
    errorSummaryList.replaceChildren();
    if (!errors.length) {
      errorSummary.hidden = true;
      return;
    }
    errors.forEach(function (error) {
      const item = document.createElement('li');
      const link = document.createElement('a');
      link.href = `#${fields[error.name].element.id}`;
      link.textContent = error.message;
      item.appendChild(link);
      errorSummaryList.appendChild(item);
    });
    errorSummary.hidden = false;
  }

  drawerToggle.addEventListener('click', function () {
    renderDrawer(shell.dataset.drawer === 'open' ? 'hidden' : 'open');
  });
  themeToggle.addEventListener('click', function () {
    renderTheme(shell.dataset.theme === 'light' ? 'dark' : 'light');
  });

  Object.entries(fields).forEach(function ([name, field]) {
    field.element.addEventListener('blur', function () { renderField(name); });
    field.element.addEventListener('input', function () {
      if (field.element.getAttribute('aria-invalid') === 'true') renderField(name);
    });
  });

  form.addEventListener('submit', function (event) {
    event.preventDefault();
    const errors = Object.keys(fields).map(function (name) {
      const message = renderField(name);
      return message ? { name: name, message: message } : null;
    }).filter(Boolean);
    renderSummary(errors);
    if (errors.length) errorSummary.focus();
  });

  renderDrawer(params.get('drawer') === 'hidden' ? 'hidden' : 'open');
  renderTheme(params.get('theme') === 'dark' ? 'dark' : 'light');
}());
