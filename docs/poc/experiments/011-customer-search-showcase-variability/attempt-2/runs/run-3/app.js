const customers = [
  { id: 'C000001', name: '山田 太郎', birthdate: '1984-05-12', address: '東京都千代田区丸の内 1-2-3', phone: '03-1234-5678', email: 'taro.yamada@example.jp', note: '連絡は平日午後を希望' },
  { id: 'C000002', name: '佐藤 花子', birthdate: '1990-11-23', address: '神奈川県横浜市西区みなとみらい 2-4-1', phone: '045-234-5678', email: 'hanako.sato@example.jp', note: '' },
  { id: 'C000003', name: '鈴木 一郎', birthdate: '1977-02-08', address: '埼玉県さいたま市大宮区桜木町 3-5-2', phone: '048-345-6789', email: 'ichiro.suzuki@example.jp', note: '郵送物は勤務先住所へ' },
  { id: 'C000004', name: '高橋 美咲', birthdate: '1988-08-30', address: '千葉県船橋市本町 4-8-6', phone: '047-456-7890', email: 'misaki.takahashi@example.jp', note: '' },
  { id: 'C000005', name: '田中 健', birthdate: '1973-12-16', address: '東京都世田谷区三軒茶屋 5-1-9', phone: '03-5678-9012', email: 'ken.tanaka@example.jp', note: '電話番号の確認済み' },
  { id: 'C000006', name: '伊藤 優子', birthdate: '1995-03-27', address: '東京都杉並区高円寺南 6-3-4', phone: '03-6789-0123', email: 'yuko.ito@example.jp', note: '' }
];
const pageSize = 4;
let filtered = [...customers], page = 1, sortDirection = 'asc';
const $ = (id) => document.getElementById(id);
const normalize = (value) => value.replace(/[\s-]/g, '').toLocaleLowerCase('ja-JP');

function render() {
  const start = (page - 1) * pageSize;
  const rows = filtered.slice(start, start + pageSize);
  $('count').textContent = `（${filtered.length}件）`;
  $('result-context').textContent = filtered.length ? '条件に一致する顧客を表示しています。' : '条件に一致する顧客はいません。';
  $('result-body').innerHTML = rows.length ? rows.map((c) => `<tr><td>${c.id}</td><td><button class="customer-link" type="button" data-id="${c.id}">${c.name}</button></td><td>${c.birthdate}</td><td>${c.address}</td><td>${c.phone}</td><td>${c.email}</td><td class="note">${c.note || '—'}</td></tr>`).join('') : '<tr><td class="empty-row" colspan="7">該当する顧客が見つかりませんでした。</td></tr>';
  const pages = Math.max(1, Math.ceil(filtered.length / pageSize));
  $('page-status').textContent = `${page} / ${pages} ページ`;
  $('previous').disabled = page === 1;
  $('next').disabled = page === pages;
  document.querySelectorAll('.customer-link').forEach((button) => button.addEventListener('click', () => openDetails(button.dataset.id)));
}
function applySearch() {
  const terms = { name: normalize($('name').value), birthdate: $('birthdate').value, phone: normalize($('phone').value), email: normalize($('email').value) };
  filtered = customers.filter((c) => (!terms.name || normalize(c.name).includes(terms.name)) && (!terms.birthdate || c.birthdate === terms.birthdate) && (!terms.phone || normalize(c.phone).includes(terms.phone)) && (!terms.email || normalize(c.email).includes(terms.email)));
  page = 1; render();
  $('live-region').textContent = `${filtered.length}件の顧客を検索しました。`;
}
function openDetails(id) {
  const c = customers.find((customer) => customer.id === id);
  $('detail-title').textContent = `${c.name} の顧客情報`;
  $('detail-content').innerHTML = [['顧客ID', c.id], ['氏名', c.name], ['生年月日', c.birthdate], ['住所', c.address], ['電話番号', c.phone], ['メールアドレス', c.email], ['備考', c.note || '—']].map(([term, value]) => `<div><dt>${term}</dt><dd>${value}</dd></div>`).join('');
  $('detail-dialog').showModal();
}
$('search-form').addEventListener('submit', (event) => { event.preventDefault(); applySearch(); });
$('clear').addEventListener('click', () => { $('search-form').reset(); filtered = [...customers]; page = 1; render(); $('live-region').textContent = '検索条件をクリアしました。'; });
$('previous').addEventListener('click', () => { page--; render(); });
$('next').addEventListener('click', () => { page++; render(); });
document.querySelector('.sort-button').addEventListener('click', () => { sortDirection = sortDirection === 'asc' ? 'desc' : 'asc'; filtered.sort((a,b) => a.name.localeCompare(b.name, 'ja') * (sortDirection === 'asc' ? 1 : -1)); document.querySelector('.sort-button').innerHTML = `氏名 <span aria-hidden="true">${sortDirection === 'asc' ? '↑' : '↓'}</span>`; document.querySelector('.sort-button').closest('th').setAttribute('aria-sort', sortDirection === 'asc' ? 'ascending' : 'descending'); render(); });
$('close-dialog').addEventListener('click', () => $('detail-dialog').close());
$('theme-toggle').addEventListener('click', () => { const dark = document.documentElement.dataset.theme !== 'dark'; document.documentElement.dataset.theme = dark ? 'dark' : ''; $('theme-toggle').setAttribute('aria-label', dark ? 'ライトモードに切り替え' : 'ダークモードに切り替え'); });
render();
