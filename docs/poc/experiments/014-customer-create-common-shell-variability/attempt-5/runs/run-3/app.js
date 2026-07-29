(function () {
  const shell = document.querySelector('.shared-shell');
  const drawerToggle = document.querySelector('[data-drawer-toggle]');
  const themeToggle = document.querySelector('[data-theme-toggle]');
  const themeIcon = document.querySelector('[data-theme-icon]');
  const form = document.querySelector('#customer-form');
  const summary = document.querySelector('#error-summary');
  const summaryList = summary.querySelector('ul');
  const params = new URLSearchParams(window.location.search);

  const fields = {
    name: { label: '氏名', required: true },
    'birth-date': { label: '生年月日', required: true, message: '生年月日は YYYY-MM-DD 形式で入力してください。', test: (value) => /^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])$/.test(value) && !Number.isNaN(Date.parse(`${value}T00:00:00`)) },
    address: { label: '住所', required: true },
    phone: { label: '電話番号', required: true, message: '電話番号はハイフンを含む形式で入力してください。', test: (value) => /^0\d{1,4}-\d{1,4}-\d{4}$/.test(value) },
    email: { label: 'メールアドレス', required: true, message: 'メールアドレスの形式で入力してください。', test: (value) => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value) }
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

  function clearFieldError(input) {
    const message = document.querySelector(`#${input.id}-message`);
    input.closest('.field').classList.remove('is-invalid');
    input.removeAttribute('aria-invalid');
    message.textContent = message.dataset.helper || '';
  }

  function setFieldError(input, message) {
    const field = input.closest('.field');
    field.classList.add('is-invalid');
    input.setAttribute('aria-invalid', 'true');
    document.querySelector(`#${input.id}-message`).textContent = message;
  }

  function validateField(input) {
    const rule = fields[input.id];
    const value = input.value.trim();
    if (rule.required && !value) return `${rule.label}は必須です。`;
    if (value && rule.test && !rule.test(value)) return rule.message;
    return '';
  }

  drawerToggle.addEventListener('click', () => renderDrawer(shell.dataset.drawer === 'open' ? 'hidden' : 'open'));
  themeToggle.addEventListener('click', () => renderTheme(shell.dataset.theme === 'light' ? 'dark' : 'light'));

  Object.keys(fields).forEach((id) => {
    const input = document.getElementById(id);
    const message = document.querySelector(`#${id}-message`);
    message.dataset.helper = message.textContent;
    input.addEventListener('input', () => clearFieldError(input));
    input.addEventListener('blur', () => {
      const error = validateField(input);
      if (error) setFieldError(input, error);
    });
  });

  form.addEventListener('submit', (event) => {
    event.preventDefault();
    const errors = [];
    Object.keys(fields).forEach((id) => {
      const input = document.getElementById(id);
      const message = validateField(input);
      if (message) {
        setFieldError(input, message);
        errors.push({ id, message });
      } else {
        clearFieldError(input);
      }
    });

    summaryList.replaceChildren();
    if (!errors.length) {
      summary.hidden = true;
      return;
    }
    errors.forEach(({ id, message }) => {
      const item = document.createElement('li');
      const link = document.createElement('a');
      link.href = `#${id}`;
      link.textContent = message;
      link.addEventListener('click', () => document.getElementById(id).focus());
      item.append(link);
      summaryList.append(item);
    });
    summary.hidden = false;
    summary.focus();
  });

  renderDrawer(params.get('drawer') === 'hidden' ? 'hidden' : 'open');
  renderTheme(params.get('theme') === 'dark' ? 'dark' : 'light');
}());
