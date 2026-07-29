const shell = document.querySelector('.shell');
const drawerToggle = document.querySelector('#drawer-toggle');
const themeToggle = document.querySelector('#theme-toggle');

const values = {
  drawer: new Set(['open', 'hidden']),
  theme: new Set(['light', 'dark'])
};

function readInitialState() {
  const parameters = new URLSearchParams(window.location.search);
  return {
    drawer: values.drawer.has(parameters.get('drawer')) ? parameters.get('drawer') : 'open',
    theme: values.theme.has(parameters.get('theme')) ? parameters.get('theme') : 'light'
  };
}

function updateUrl(state) {
  const url = new URL(window.location.href);
  url.searchParams.set('drawer', state.drawer);
  url.searchParams.set('theme', state.theme);
  window.history.replaceState({}, '', url);
}

function render(state, writeUrl = false) {
  shell.dataset.drawer = state.drawer;
  shell.dataset.theme = state.theme;
  drawerToggle.setAttribute('aria-expanded', String(state.drawer === 'open'));
  drawerToggle.setAttribute('aria-label', state.drawer === 'open' ? 'Drawer を閉じる' : 'Drawer を開く');
  themeToggle.setAttribute('aria-label', state.theme === 'light' ? 'ダークテーマに切り替える' : 'ライトテーマに切り替える');
  if (writeUrl) updateUrl(state);
}

let state = readInitialState();
render(state, true);

drawerToggle.addEventListener('click', () => {
  state = { ...state, drawer: state.drawer === 'open' ? 'hidden' : 'open' };
  render(state, true);
});

themeToggle.addEventListener('click', () => {
  state = { ...state, theme: state.theme === 'light' ? 'dark' : 'light' };
  render(state, true);
});
