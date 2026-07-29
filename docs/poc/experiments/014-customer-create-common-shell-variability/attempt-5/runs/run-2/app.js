(function () {
  const shell = document.querySelector('.shared-shell');
  const drawerToggle = document.querySelector('[data-drawer-toggle]');
  const themeToggle = document.querySelector('[data-theme-toggle]');
  const themeIcon = document.querySelector('[data-theme-icon]');
  const form = document.querySelector('.customer-form');
  const errorSummary = document.querySelector('[data-error-summary]');
  const errorList = document.querySelector('[data-error-list]');
  const params = new URLSearchParams(window.location.search);
  const helpers = {
    birthdate: 'YYYY-MM-DD形式で入力してください。',
    phone: 'ハイフンを含む電話番号形式で入力してください。',
    email: 'メールアドレス形式で入力してください。'
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

  function setFieldMessage(field, message) {
    const messageElement = document.querySelector(`[data-message-for="${field.name}"]`);
    field.setAttribute('aria-invalid', message ? 'true' : 'false');
    messageElement.textContent = message || helpers[field.name] || '';
    messageElement.classList.toggle('helper', !message && Boolean(helpers[field.name]));
  }

  function validateField(field) {
    const value = field.value.trim();
    if (field.required && !value) return '入力してください。';
    if (!value) return '';
    if (field.name === 'birthdate' && !/^\\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01])$/.test(value)) return helpers.birthdate;
    if (field.name === 'phone' && !/^0\\d{1,4}-\\d{1,4}-\\d{3,4}$/.test(value)) return helpers.phone;
    if (field.name === 'email' && !/^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$/.test(value)) return helpers.email;
    return '';
  }

  function validateForm() {
    const fields = Array.from(form.querySelectorAll('input[required]'));
    const invalidFields = fields.map(function (field) {
      const message = validateField(field);
      setFieldMessage(field, message);
      return { field, message };
    }).filter(function (result) { return result.message; });

    errorList.replaceChildren();
    if (invalidFields.length) {
      invalidFields.forEach(function (result) {
        const item = document.createElement('li');
        const link = document.createElement('a');
        link.href = `#${result.field.id}`;
        link.textContent = `${result.field.labels[0].textContent.trim()}: ${result.message}`;
        link.addEventListener('click', function () { result.field.focus(); });
        item.appendChild(link);
        errorList.appendChild(item);
      });
      errorSummary.hidden = false;
      errorSummary.focus();
      return false;
    }
    errorSummary.hidden = true;
    return true;
  }

  drawerToggle.addEventListener('click', function () {
    renderDrawer(shell.dataset.drawer === 'open' ? 'hidden' : 'open');
  });
  themeToggle.addEventListener('click', function () {
    renderTheme(shell.dataset.theme === 'light' ? 'dark' : 'light');
  });
  form.addEventListener('submit', function (event) {
    event.preventDefault();
    validateForm();
  });
  form.querySelectorAll('input[required]').forEach(function (field) {
    field.addEventListener('input', function () {
      if (field.getAttribute('aria-invalid') === 'true') setFieldMessage(field, validateField(field));
    });
  });

  renderDrawer(params.get('drawer') === 'hidden' ? 'hidden' : 'open');
  renderTheme(params.get('theme') === 'dark' ? 'dark' : 'light');
}());
