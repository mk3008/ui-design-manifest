const customers = [
  { id: "C000001", name: "佐藤 花子", birthday: "1987-04-12", address: "東京都世田谷区桜丘 1-2-3", phone: "090-1234-5678", email: "hanako.sato@example.jp", note: "連絡は平日午後を希望" },
  { id: "C000002", name: "鈴木 恒一", birthday: "1979-11-08", address: "神奈川県横浜市青葉区美しが丘 4-5-6", phone: "080-2345-6789", email: "koichi.suzuki@example.jp", note: "" },
  { id: "C000003", name: "高橋 美咲", birthday: "1992-07-24", address: "千葉県千葉市中央区新田町 7-8-9", phone: "070-3456-7890", email: "misaki.takahashi@example.jp", note: "メールでの案内を希望" },
  { id: "C000004", name: "田中 健", birthday: "1968-02-16", address: "埼玉県さいたま市浦和区常盤 2-4-1", phone: "090-4567-8901", email: "ken.tanaka@example.jp", note: "" },
  { id: "C000005", name: "伊藤 由紀", birthday: "1985-09-30", address: "東京都杉並区高円寺南 3-6-2", phone: "080-5678-9012", email: "yuki.ito@example.jp", note: "住所変更の確認済み" }
];

const form = document.querySelector("#search-form");
const body = document.querySelector("#results-body");
const count = document.querySelector("#result-count");
const context = document.querySelector("#result-context");
const empty = document.querySelector("#empty-state");

function escapeHtml(value) {
  return String(value).replace(/[&<>'"]/g, char => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", "'": "&#39;", '"': "&quot;" })[char]);
}

function render(results, isFiltered) {
  count.textContent = `${results.length}件`;
  context.textContent = isFiltered ? "指定した条件に一致する顧客を表示しています。" : "すべての顧客を表示しています。";
  body.innerHTML = results.map(customer => `<tr><td>${escapeHtml(customer.id)}</td><td>${escapeHtml(customer.name)}</td><td>${escapeHtml(customer.birthday)}</td><td>${escapeHtml(customer.address)}</td><td>${escapeHtml(customer.phone)}</td><td>${escapeHtml(customer.email)}</td><td>${escapeHtml(customer.note || "—")}</td></tr>`).join("");
  empty.hidden = results.length !== 0;
}

form.addEventListener("submit", event => {
  event.preventDefault();
  const values = Object.fromEntries(new FormData(form));
  const fields = ["name", "birthday", "phone", "email"];
  const active = fields.filter(field => values[field].trim());
  const results = customers.filter(customer => active.every(field => customer[field].toLowerCase().includes(values[field].trim().toLowerCase())));
  render(results, active.length > 0);
});

document.querySelector("#clear-button").addEventListener("click", () => { form.reset(); render(customers, false); document.querySelector("#name").focus(); });
render(customers, false);
