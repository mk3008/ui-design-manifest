(function () {
  const shell = document.querySelector('.shared-shell');
  const drawerToggle = document.querySelector('[data-drawer-toggle]');
  const themeToggle = document.querySelector('[data-theme-toggle]');
  const themeIcon = document.querySelector('[data-theme-icon]');
  const form = document.querySelector('#customer-form');
  const errorSummary = document.querySelector('#error-summary');
  const errorSummaryList = document.querySelector('#error-summary-list');
  const params = new URLSearchParams(window.location.search);
  const fields = [
    { id: 'full-name', label: '氏名', validate: required },
    { id: 'birth-date', label: '生年月日', validate: validateDate },
    { id: 'address', label: '住所', validate: required },
    { id: 'phone', label: '電話番号', validate: validatePhone },
    { id: 'email', label: 'メールアドレス', validate: validateEmail }
  ];

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

  function required(value, label) {
    return value.trim() ? '' : `${label}を入力してください。`;
  }

  function validateDate(value, label) {
    if (!value.trim()) return `${label}を入力してください。`;
    const match = /^(\d{4})-(\d{2})-(\d{2})$/.exec(value);
    if (!match) return `${label}はYYYY-MM-DD形式で入力してください。`;
    const date = new Date(`${value}T00:00:00`);
    const isValid = !Number.isNaN(date.getTime()) && date.getFullYear() === Number(match[1]) && date.getMonth() + 1 === Number(match[2]) && date.getDate() === Number(match[3]);
    return isValid ? '' : `${label}はYYYY-MM-DD形式で入力してください。`;
  }

  function validatePhone(value, label) {
    if (!value.trim()) return `${label}を入力してください。`;
    return /^\d{2,4}-\d{2,4}-\d{3,4}$/.test(value) ? '' : `${label}はハイフンを含む数字形式で入力してください。`;
  }

  function validateEmail(value, label) {
    if (!value.trim()) return `${label}を入力してください。`;
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value) ? '' : `${label}はメールアドレス形式で入力してください。`;
  }

  function setFieldError(field, message) {
    const input = document.querySelector(`#${field.id}`);
    const messageElement = document.querySelector(`#${field.id}-message`);
    input.setAttribute('aria-invalid', message ? 'true' : 'false');
    messageElement.textContent = message || helperText(field.id);
    messageElement.classList.toggle('helper', !message && Boolean(helperText(field.id)));
    return message;
  }

  function helperText(id) {
    const helpers = {
      'birth-date': '生年月日はYYYY-MM-DD形式で入力してください。',
      phone: '電話番号はハイフンを含む数字形式で入力してください。'
    };
    return helpers[id] || '';
  }

  function validateField(field) {
    const input = document.querySelector(`#${field.id}`);
    return setFieldError(field, field.validate(input.value, field.label));
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
      link.href = `#${error.id}`;
      link.textContent = error.message;
      item.append(link);
      errorSummaryList.append(item);
    });
    errorSummary.hidden = false;
  }

  function refreshVisibleSummary() {
    if (errorSummary.hidden) return;
    const errors = fields.map(function (field) {
      const input = document.querySelector(`#${field.id}`);
      const message = document.querySelector(`#${field.id}-message`).textContent;
      return input.getAttribute('aria-invalid') === 'true' ? { id: field.id, message } : null;
    }).filter(Boolean);
    renderSummary(errors);
  }

  drawerToggle.addEventListener('click', function () {
    renderDrawer(shell.dataset.drawer === 'open' ? 'hidden' : 'open');
  });
  themeToggle.addEventListener('click', function () {
    renderTheme(shell.dataset.theme === 'light' ? 'dark' : 'light');
  });
  fields.forEach(function (field) {
    const input = document.querySelector(`#${field.id}`);
    input.addEventListener('blur', function () { validateField(field); });
    input.addEventListener('input', function () {
      if (input.getAttribute('aria-invalid') === 'true') {
        validateField(field);
        refreshVisibleSummary();
      }
    });
  });
  form.addEventListener('submit', function (event) {
    event.preventDefault();
    const errors = fields.map(function (field) {
      const message = validateField(field);
      return message ? { id: field.id, message } : null;
    }).filter(Boolean);
    renderSummary(errors);
    if (errors.length) errorSummary.focus();
  });

  renderDrawer(initialDrawer);
  renderTheme(initialTheme);
}());
