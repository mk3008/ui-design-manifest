const customers = [
  { id: "000001", name: "佐藤 花子", birthDate: "1987-04-12", address: "東京都千代田区丸の内 1-1-1", phone: "03-1234-5678", email: "hanako.sato@example.jp", notes: "連絡は平日の日中を希望" },
  { id: "000002", name: "鈴木 恒一", birthDate: "1976-11-28", address: "神奈川県横浜市西区みなとみらい 2-3-4", phone: "045-234-5678", email: "koichi.suzuki@example.jp", notes: "" },
  { id: "000003", name: "田中 美咲", birthDate: "1993-08-05", address: "埼玉県さいたま市大宮区桜木町 3-2-1", phone: "048-345-6789", email: "misaki.tanaka@example.jp", notes: "メールでの連絡を希望" },
  { id: "000004", name: "高橋 健", birthDate: "1969-02-19", address: "千葉県船橋市本町 4-5-6", phone: "047-456-7890", email: "ken.takahashi@example.jp", notes: "" }
];
const form = document.querySelector("#search-form"), body = document.querySelector("#results-body"), count = document.querySelector("#result-count"), empty = document.querySelector("#empty-state"), dialog = document.querySelector("#detail-dialog");
const normalize = value => value.trim().toLocaleLowerCase("ja-JP");
function render(records) {
  body.replaceChildren();
  records.forEach(customer => {
    const row = document.createElement("tr");
    row.innerHTML = `<td>${customer.id}</td><td><button class="customer-link" type="button" data-id="${customer.id}">${customer.name}</button></td><td>${customer.birthDate}</td><td>${customer.address}</td><td>${customer.phone}</td><td>${customer.email}</td>`;
    body.append(row);
  });
  count.textContent = `(${records.length}件)`;
  empty.hidden = records.length !== 0;
}
function showDetails(customer) {
  document.querySelector("#detail-title").textContent = `顧客詳細: ${customer.name}`;
  const details = [["顧客ID", customer.id], ["氏名", customer.name], ["生年月日", customer.birthDate], ["住所", customer.address], ["電話番号", customer.phone], ["メールアドレス", customer.email], ["備考", customer.notes || "登録なし"]];
  document.querySelector("#customer-details").replaceChildren(...details.flatMap(([term, description]) => { const dt=document.createElement("dt"), dd=document.createElement("dd"); dt.textContent=term; dd.textContent=description; return [dt,dd]; }));
  dialog.showModal(); document.querySelector("#close-dialog").focus();
}
form.addEventListener("submit", event => { event.preventDefault(); const data = new FormData(form); const filters = Object.fromEntries(data); render(customers.filter(c => Object.entries(filters).every(([key, value]) => !value || normalize(c[key]).includes(normalize(value))))); });
document.querySelector("#clear").addEventListener("click", () => { form.reset(); render(customers); document.querySelector("[name=name]").focus(); });
body.addEventListener("click", event => { const button = event.target.closest("[data-id]"); if (button) showDetails(customers.find(c => c.id === button.dataset.id)); });
document.querySelectorAll("#close-dialog, #done").forEach(button => button.addEventListener("click", () => dialog.close()));
document.querySelector("#theme-toggle").addEventListener("click", event => { const root=document.documentElement, dark=root.dataset.theme === "dark"; root.dataset.theme=dark ? "light" : "dark"; event.currentTarget.textContent=dark ? "テーマ: ライト" : "テーマ: ダーク"; event.currentTarget.setAttribute("aria-label", dark ? "ダークテーマに切り替える" : "ライトテーマに切り替える"); });
render(customers);
