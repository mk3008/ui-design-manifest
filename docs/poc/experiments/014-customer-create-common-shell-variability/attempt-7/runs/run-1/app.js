(function () {
  const shell = document.querySelector('.shared-shell');
  const drawerToggle = document.querySelector('[data-drawer-toggle]');
  const themeToggle = document.querySelector('[data-theme-toggle]');
  const themeIcon = document.querySelector('[data-theme-icon]');
  const form = document.querySelector('#customer-form');
  const summary = document.querySelector('#error-summary');
  const errorList = document.querySelector('#error-list');
  const params = new URLSearchParams(window.location.search);
  const fields = [
    { id: 'name', label: '氏名', validate: value => value.trim() ? '' : '氏名は必須です。' },
    { id: 'birthdate', label: '生年月日', validate: value => {
      if (!value.trim()) return '生年月日は必須です。';
      if (!/^\\d{4}-\\d{2}-\\d{2}$/.test(value)) return '生年月日は YYYY-MM-DD 形式で入力してください。';
      const date = new Date(`${value}T00:00:00`);
      return Number.isNaN(date.getTime()) || date.toISOString().slice(0, 10) !== value
        ? '生年月日は有効な日付を入力してください。' : '';
    } },
    { id: 'address', label: '住所', validate: value => value.trim() ? '' : '住所は必須です。' },
    { id: 'phone', label: '電話番号', validate: value => {
      if (!value.trim()) return '電話番号は必須です。';
      return /^[0-9]+(?:-[0-9]+)+$/.test(value) ? '' : '電話番号は数字とハイフンを使用して入力してください。';
    } },
    { id: 'email', label: 'メールアドレス', validate: value => {
      if (!value.trim()) return 'メールアドレスは必須です。';
      return /^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$/.test(value) ? '' : 'メールアドレスは name@example.com 形式で入力してください。';
    } }
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

  function setFieldMessage(field, message) {
    const input = document.querySelector(`#${field.id}`);
    const messageElement = document.querySelector(`#${field.id}-message`);
    input.setAttribute('aria-invalid', String(Boolean(message)));
    messageElement.textContent = message || (messageElement.classList.contains('helper') ? messageElement.dataset.helper : '');
    messageElement.classList.toggle('helper', !message && Boolean(messageElement.dataset.helper));
  }

  function validateField(field) {
    const input = document.querySelector(`#${field.id}`);
    const message = field.validate(input.value);
    setFieldMessage(field, message);
    return message;
  }

  function renderSummary(errors) {
    errorList.replaceChildren();
    if (!errors.length) { summary.hidden = true; return; }
    errors.forEach(({ field, message }) => {
      const item = document.createElement('li');
      const link = document.createElement('a');
      link.href = `#${field.id}`;
      link.textContent = `${field.label}: ${message}`;
      item.append(link);
      errorList.append(item);
    });
    summary.hidden = false;
  }

  drawerToggle.addEventListener('click', () => renderDrawer(shell.dataset.drawer === 'open' ? 'hidden' : 'open'));
  themeToggle.addEventListener('click', () => renderTheme(shell.dataset.theme === 'light' ? 'dark' : 'light'));

  fields.forEach(field => {
    const input = document.querySelector(`#${field.id}`);
    const messageElement = document.querySelector(`#${field.id}-message`);
    if (messageElement.classList.contains('helper')) messageElement.dataset.helper = messageElement.textContent;
    input.addEventListener('blur', () => validateField(field));
    input.addEventListener('input', () => {
      if (input.getAttribute('aria-invalid') === 'true') validateField(field);
    });
  });

  form.addEventListener('submit', event => {
    event.preventDefault();
    const errors = fields.map(field => ({ field, message: validateField(field) })).filter(item => item.message);
    renderSummary(errors);
    if (errors.length) summary.focus();
  });

  renderDrawer(params.get('drawer') === 'hidden' ? 'hidden' : 'open');
  renderTheme(params.get('theme') === 'dark' ? 'dark' : 'light');
}());
