(function () {
  const form = document.querySelector('[data-customer-create-form]');
  if (!form) return;

  const fields = Array.from(form.querySelectorAll('input, textarea'));
  const summary = form.querySelector('[data-error-summary]');
  const summaryList = form.querySelector('[data-error-summary-list]');
  const status = form.querySelector('#form-status');

  function errorText(field) {
    const value = field.value.trim();
    const label = field.labels[0].childNodes[0].textContent.trim();
    if (field.required && !value) return `${label}を入力してください。`;
    if (!value) return '';
    if (field.id === 'birth-date' && !/^\d{4}-\d{2}-\d{2}$/.test(value)) {
      return '生年月日は YYYY-MM-DD 形式で入力してください。';
    }
    if (field.id === 'telephone' && !/^[0-9]{2,4}-[0-9]{2,4}-[0-9]{3,4}$/.test(value)) {
      return '電話番号は数字とハイフンを使用して入力してください。';
    }
    if (field.id === 'email' && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)) {
      return 'メールアドレスは name@example.jp 形式で入力してください。';
    }
    return '';
  }

  function setFieldState(field, shouldShow) {
    const message = errorText(field);
    const error = form.querySelector(`[data-error-for="${field.id}"]`);
    if (shouldShow && message) {
      field.setAttribute('aria-invalid', 'true');
      error.textContent = message;
      return message;
    }
    field.removeAttribute('aria-invalid');
    error.textContent = '';
    return '';
  }

  function updateSummary(messages, moveFocus) {
    summaryList.replaceChildren();
    if (!messages.length) {
      summary.hidden = true;
      return;
    }
    messages.forEach(({ field, message }) => {
      const item = document.createElement('li');
      const link = document.createElement('a');
      link.href = `#${field.id}`;
      link.textContent = message;
      link.addEventListener('click', function () { field.focus(); });
      item.appendChild(link);
      summaryList.appendChild(item);
    });
    summary.hidden = false;
    if (moveFocus) summary.focus();
  }

  fields.forEach((field) => {
    field.addEventListener('blur', function () {
      setFieldState(field, true);
    });
    field.addEventListener('input', function () {
      if (field.getAttribute('aria-invalid') === 'true') setFieldState(field, true);
    });
  });

  form.addEventListener('submit', function (event) {
    event.preventDefault();
    const messages = fields.map((field) => ({ field, message: setFieldState(field, true) }))
      .filter(({ message }) => message);
    updateSummary(messages, messages.length > 0);
    if (messages.length) {
      status.textContent = '';
      return;
    }
    status.textContent = '保存はこの静的サンプルでは実行されません。入力内容は保存されていません。';
  });
}());
