(function () {
  const toggle = document.querySelector('.drawer-toggle');
  const parent = document.querySelector('.nav-parent');
  const children = document.querySelector('.nav-children');
  const params = new URLSearchParams(window.location.search);

  function setDrawer(hidden) {
    document.body.classList.toggle('drawer-hidden', hidden);
    toggle.setAttribute('aria-expanded', String(!hidden));
  }

  setDrawer(params.get('drawer') === 'hidden');

  toggle.addEventListener('click', function () {
    setDrawer(!document.body.classList.contains('drawer-hidden'));
  });

  parent.addEventListener('click', function () {
    const expanded = parent.getAttribute('aria-expanded') === 'true';
    parent.setAttribute('aria-expanded', String(!expanded));
    children.hidden = expanded;
  });
}());
