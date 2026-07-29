(function () {
  const shell = document.querySelector('.shared-shell');
  const drawerToggle = document.querySelector('[data-drawer-toggle]');
  const themeToggle = document.querySelector('[data-theme-toggle]');
  const themeIcon = document.querySelector('[data-theme-icon]');
  const form = document.querySelector('#customer-form');
  const summary = document.querySelector('#validation-summary');
  const summaryList = document.querySelector('#validation-summary-list');
  const params = new URLSearchParams(window.location.search);

  const requestedDrawer = params.get('drawer');
  const requestedTheme = params.get('theme');

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

  function validationMessage(input) {
    const value = input.value.trim();
    if (!value) return '必須項目です。入力してください。';
    if (input.id === 'birth-date') {
      const match = /^(\d{4})-(\d{2})-(\d{2})$/.exec(value);
      const date = match && new Date(`${value}T00:00:00`);
      if (!match || date.getFullYear() !== Number(match[1]) || date.getMonth() + 1 !== Number(match[2]) || date.getDate() !== Number(match[3])) {
        return '生年月日は YYYY-MM-DD 形式の有効な日付で入力してください。';
      }
    }
    if (input.id === 'phone' && !/^\d{1,5}-\d{1,5}-\d{1,5}$/.test(value)) {
      return '電話番号は半角数字とハイフンで入力してください。';
    }
    if (input.id === 'email' && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)) {
      return 'メールアドレスの形式で入力してください。';
    }
    return '';
  }

  function setFieldError(input, message) {
    const error = document.querySelector(`#${input.id}-error`);
    input.setAttribute('aria-invalid', String(Boolean(message)));
    error.textContent = message;
    return message;
  }

  function validateForm() {
    const requiredInputs = Array.from(form.querySelectorAll('input'));
    const errors = requiredInputs.map((input) => ({ input, message: setFieldError(input, validationMessage(input)) })).filter((item) => item.message);
    summaryList.replaceChildren();
    if (errors.length) {
      errors.forEach(({ input, message }) => {
        const item = document.createElement('li');
        const link = document.createElement('a');
        link.href = `#${input.id}`;
        link.textContent = `${input.labels[0].textContent.replace(/必須/, '').trim()}: ${message}`;
        link.addEventListener('click', function (event) {
          event.preventDefault();
          input.focus();
        });
        item.appendChild(link);
        summaryList.appendChild(item);
      });
      summary.hidden = false;
      summary.focus();
    } else {
      summary.hidden = true;
    }
    return errors.length === 0;
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
  form.querySelectorAll('input').forEach((input) => {
    input.addEventListener('blur', function () {
      if (input.getAttribute('aria-invalid') === 'true') setFieldError(input, validationMessage(input));
    });
  });

  renderDrawer(requestedDrawer === 'hidden' ? 'hidden' : 'open');
  renderTheme(requestedTheme === 'dark' ? 'dark' : 'light');
}());
