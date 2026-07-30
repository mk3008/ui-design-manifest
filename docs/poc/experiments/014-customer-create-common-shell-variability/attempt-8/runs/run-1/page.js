(function () {
  const form = document.querySelector('#customer-form');
  const summary = document.querySelector('#form-summary');
  const summaryList = document.querySelector('#form-summary-list');

  const fields = [
    { id: 'customer-name', label: '氏名', validate: required },
    { id: 'birth-date', label: '生年月日', validate: dateValue },
    { id: 'address', label: '住所', validate: required },
    { id: 'telephone', label: '電話番号', validate: telephoneValue },
    { id: 'email', label: 'メールアドレス', validate: emailValue },
    { id: 'notes', label: '備考', validate: function () { return ''; } }
  ];

  function required(value, label) {
    return value.trim() ? '' : `${label}を入力してください。`;
  }

  function dateValue(value, label) {
    if (!value.trim()) return `${label}を入力してください。`;
    const match = /^(\d{4})-(\d{2})-(\d{2})$/.exec(value.trim());
    if (!match) return `${label}は YYYY-MM-DD 形式で入力してください。`;
    const date = new Date(`${value.trim()}T00:00:00`);
    const valid = !Number.isNaN(date.getTime()) && date.getFullYear() === Number(match[1]) && date.getMonth() + 1 === Number(match[2]) && date.getDate() === Number(match[3]);
    return valid ? '' : `${label}は YYYY-MM-DD 形式で入力してください。`;
  }

  function telephoneValue(value, label) {
    if (!value.trim()) return `${label}を入力してください。`;
    return /^[0-9]{2,4}-[0-9]{2,4}-[0-9]{3,4}$/.test(value.trim()) ? '' : `${label}は数字とハイフンを使用して入力してください。`;
  }

  function emailValue(value, label) {
    if (!value.trim()) return `${label}を入力してください。`;
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value.trim()) ? '' : `${label}はメールアドレス形式で入力してください。`;
  }

  function helperText(field) {
    if (field.id === 'birth-date') return '生年月日は YYYY-MM-DD 形式で入力してください。';
    if (field.id === 'telephone') return '電話番号は数字とハイフンを使用して入力してください。';
    if (field.id === 'email') return 'メールアドレスはメールアドレス形式で入力してください。';
    return '';
  }

  function renderField(field, showError) {
    const input = document.getElementById(field.id);
    const message = document.getElementById(`${field.id}-message`);
    const error = field.validate(input.value, field.label);
    const shouldShow = showError && Boolean(error);

    input.setAttribute('aria-invalid', String(shouldShow));
    message.classList.toggle('field-help', !shouldShow && Boolean(helperText(field)));
    message.textContent = shouldShow ? error : helperText(field);
    return error;
  }

  function renderSummary(errors, focusSummary) {
    summaryList.replaceChildren();
    if (!errors.length) {
      summary.hidden = true;
      return;
    }

    errors.forEach(function (entry) {
      const item = document.createElement('li');
      const link = document.createElement('a');
      link.href = `#${entry.field.id}`;
      link.textContent = entry.message;
      link.addEventListener('click', function () {
        document.getElementById(entry.field.id).focus();
      });
      item.appendChild(link);
      summaryList.appendChild(item);
    });
    summary.hidden = false;
    if (focusSummary) summary.focus();
  }

  fields.forEach(function (field) {
    const input = document.getElementById(field.id);
    input.addEventListener('blur', function () {
      renderField(field, true);
    });
    input.addEventListener('input', function () {
      if (input.getAttribute('aria-invalid') === 'true') renderField(field, true);
    });
  });

  form.addEventListener('submit', function (event) {
    event.preventDefault();
    const errors = fields.map(function (field) {
      const message = renderField(field, true);
      return message ? { field: field, message: message } : null;
    }).filter(Boolean);

    renderSummary(errors, true);
  });
}());
