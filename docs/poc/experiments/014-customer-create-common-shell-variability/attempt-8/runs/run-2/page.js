(() => {
  const form = document.querySelector('.customer-form');
  if (!form) return;

  const summary = document.querySelector('#form-summary');
  const note = document.querySelector('[data-submission-note]');
  const controls = [...form.querySelectorAll('input, textarea')];

  const messages = {
    name: '氏名を入力してください。',
    birthDate: '生年月日は YYYY-MM-DD 形式で入力してください。',
    address: '住所を入力してください。',
    phone: '電話番号は 03-1234-5678 形式で入力してください。',
    email: 'メールアドレスは name@example.com 形式で入力してください。'
  };

  const labels = {
    name: '氏名',
    birthDate: '生年月日',
    address: '住所',
    phone: '電話番号',
    email: 'メールアドレス'
  };

  const isValidDate = (value) => {
    if (!/^\d{4}-\d{2}-\d{2}$/.test(value)) return false;
    const [year, month, day] = value.split('-').map(Number);
    const date = new Date(Date.UTC(year, month - 1, day));
    return date.getUTCFullYear() === year && date.getUTCMonth() === month - 1 && date.getUTCDate() === day;
  };

  const validationError = (control) => {
    const value = control.value.trim();
    if (control.name === 'notes') return '';
    if (!value) return `${labels[control.name]}を入力してください。`;
    if (control.name === 'birthDate' && !isValidDate(value)) return messages.birthDate;
    if (control.name === 'phone' && !/^\d{2,4}-\d{2,4}-\d{3,4}$/.test(value)) return messages.phone;
    if (control.name === 'email' && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)) return messages.email;
    return '';
  };

  const renderField = (control) => {
    const field = control.closest('.form-field');
    const error = field.querySelector('.field-error');
    const help = field.querySelector('.field-help');
    const message = validationError(control);
    control.setAttribute('aria-invalid', String(Boolean(message)));
    error.textContent = message;
    error.hidden = !message;
    help.hidden = Boolean(message);
    return message;
  };

  const renderSummary = (invalidControls) => {
    if (!invalidControls.length) {
      summary.hidden = true;
      summary.replaceChildren();
      return;
    }

    const heading = document.createElement('p');
    heading.textContent = '入力内容を確認してください。';
    const list = document.createElement('ul');
    invalidControls.forEach(({ control, message }) => {
      const item = document.createElement('li');
      const link = document.createElement('a');
      link.href = `#${control.id}`;
      link.textContent = message;
      link.addEventListener('click', (event) => {
        event.preventDefault();
        control.focus();
      });
      item.append(link);
      list.append(item);
    });
    summary.replaceChildren(heading, list);
    summary.hidden = false;
  };

  controls.forEach((control) => {
    control.addEventListener('blur', () => {
      control.dataset.visited = 'true';
      renderField(control);
    });
    control.addEventListener('input', () => {
      if (control.getAttribute('aria-invalid') === 'true') renderField(control);
      note.textContent = '';
    });
  });

  form.addEventListener('submit', (event) => {
    event.preventDefault();
    const invalidControls = controls
      .map((control) => ({ control, message: renderField(control) }))
      .filter(({ message }) => message);

    renderSummary(invalidControls);
    if (invalidControls.length) {
      note.textContent = '';
      summary.focus();
      return;
    }

    note.textContent = '入力内容を確認しました。この静的画面では保存は実行されません。';
  });

  document.querySelector('[data-cancel]')?.addEventListener('click', () => {
    note.textContent = 'この静的画面ではキャンセルによる画面遷移は実行されません。';
  });
})();
