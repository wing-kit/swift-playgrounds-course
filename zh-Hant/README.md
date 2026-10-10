# Swift Playgrounds 教材（Mac＋iPad）

> **語言／Language**
> - [粵語（預設）](../README.md)
> - **繁體中文（書面語）** ← 你現在正在閱讀這份
> - [English](../en/README.md)
>
> 本目錄為繁體中文書面語譯本（非粵語口語）。Swift 程式碼與練習與粵語版相同。

專為 **Wing Kit Leung** 而設：在 **Swift Playgrounds**（Mac 或 iPad）從零學到一個可執行的 Mini Todo App。Mac 與 iPad 各有**獨立**軌道（步驟不共用）。

語氣：繁體中文書面語（香港／台灣讀者適用），步驟清楚，每課附完整可貼上的程式碼與練習。

---

## 三條軌道

| 軌道 | 路徑 | 適合 | 裝置 |
|------|------|------|------|
| **① Mac 基礎（先做）** | [`basics/`](basics/) | 尚未熟悉 Swift、想從 `print` 起 | **Mac** Playgrounds · Blank |
| **② Mac 進階** | [`lessons/`](lessons/) | 已掌握基礎，要學 SwiftUI／async／Todo | **Mac** · Blank 或 App |
| **③ iPad 獨立教材** | [`ipad/`](ipad/) | 主要使用 iPad；步驟全部按觸控重寫 | **iPad** · Blank／App Playground（`.swiftpm`） |

**①＋② 建議路徑（Mac）**

1. 完成 [`basics/README.md`](basics/)（B01–B08）
2. （可選）溫習 `lessons/01-basics-refresh.md`
3. 從 `lessons/02-swiftui-app.md` 起做到 `08` Capstone

**③ 建議路徑（iPad）**

1. 開 [`ipad/README.md`](ipad/) → 完成 `ipad/basics/`（B01–B08）
2. 依照 `ipad/lessons/` 01→08（SwiftUI 用 App Playground）
3. 速查手勢：[`ipad/CHEATSHEET.md`](ipad/CHEATSHEET.md)

已經會 `let`／Optional／func／struct → 可以跳過 basics，直接從該裝置軌道的進階 01 或 02 開始。  
**不要混用** Mac／iPad 課文步驟（程式碼可互通，介面操作不同）。

---

## 如何開始

**Mac（軌道 ①②）**

1. Mac App Store 裝 **Swift Playgrounds**（免費）。
2. 開 app → **新建 Playground**。
3. 查看每課開頭標明要用 **Blank** 或 **App**。
4. 貼上程式碼，按 ▶ 跑；`snippets/` 方便一次複製。

**iPad（軌道 ③）**

1. 依照 [`ipad/README.md`](ipad/)：iPad App Store 裝同一 app → 文件瀏覽器 **＋** → Blank／App Playground（`.swiftpm`）。
2. 步驟、手勢、分享（AirDrop／檔案 app）全部在 `ipad/` 重寫；不要直接跟隨上面 Mac 步驟。

> 注意：這套是**教材**，不會遠端修改你的裝置。全部本機 Playgrounds 自行貼上、自行執行。

---

## ① 基礎課程地圖 → [`basics/`](basics/)

| # | 檔案 | 主題 | 時間 |
|---|------|------|------|
| B01 | `basics/lessons/B01-hello-print.md` | `print`、註解 | ~15 分 |
| B02 | `basics/lessons/B02-let-var-types.md` | `let`／`var`、型別 | ~20 分 |
| B03 | `basics/lessons/B03-strings.md` | 字串、插值 | ~15 分 |
| B04 | `basics/lessons/B04-control-flow.md` | `if`／`switch`／`guard` | ~20 分 |
| B05 | `basics/lessons/B05-loops-arrays.md` | 迴圈、陣列 | ~20 分 |
| B06 | `basics/lessons/B06-collections-optionals.md` | 字典、Optional | ~25 分 |
| B07 | `basics/lessons/B07-functions-closures.md` | 函式、closure | ~25 分 |
| B08 | `basics/lessons/B08-structs-enums.md` | struct／enum／protocol | ~25 分 |

速查：[`basics/CHEATSHEET.md`](basics/CHEATSHEET.md)

---

## ② 進階課程地圖（建議順序）

| # | 檔案 | 主題 | Playground 類型 | 估計時間 |
|---|------|------|-----------------|----------|
| 01 | `lessons/01-basics-refresh.md` | `print`、`let`/`var`、字串插值（綜合快速複習） | Blank | ~15 分 |
| 02 | `lessons/02-swiftui-app.md` | App、`@State`、Button、VStack | App | ~20 分 |
| 03 | `lessons/03-multi-file.md` | 拆 View／Model | App（多檔） | ~20 分 |
| 04 | `lessons/04-list-navigation.md` | List、NavigationStack | App | ~25 分 |
| 05 | `lessons/05-async-await.md` | Task、URLSession／mock | Blank 或 App | ~25 分 |
| 06 | `lessons/06-codable-models.md` | Codable 模型 | Blank | ~20 分 |
| 07 | `lessons/07-observable-state.md` | `@Observable` 狀態 | App | ~25 分 |
| 08 | `lessons/08-capstone-mini-todo.md` | Mini Todo 總結 | App（多檔） | ~30 分 |

進階總計約 **2.5–3.5 小時**（可分成數天完成）。速查：[`CHEATSHEET.md`](CHEATSHEET.md)

---

## 資料夾結構

```
swift-playgrounds-course/
├── README.md                 ← 你而家睇緊呢份（總覽）
├── CHEATSHEET.md             ← Mac 進階／SwiftUI 速查
├── basics/                   ← ① Mac 基礎
│   ├── README.md
│   ├── CHEATSHEET.md
│   ├── lessons/B01…B08.md
│   └── snippets/B01…B08.swift
├── lessons/                  ← ② Mac 進階
│   ├── 01-basics-refresh.md
│   ├── …
│   └── 08-capstone-mini-todo.md
├── snippets/                 ← Mac 進階 snippets
└── ipad/                     ← ③ iPad 獨立教材
    ├── README.md
    ├── CHEATSHEET.md         ← iPad 手勢／選單
    ├── basics/               ← iPad 基礎 B01–B08
    ├── lessons/              ← iPad 進階 01–08
    └── snippets/
```

---

## 學習建議

1. **新手**：Mac 用 basics→進階 02；**iPad 用** [`ipad/basics/`](ipad/basics/)→[`ipad/lessons/02`](ipad/lessons/02-swiftui-app.md)（可選擇做 01 測驗）。
2. **每課做完「練習」**再進入下一課——練習不是考你，是迫使你改幾行才會記得。
3. 遇到錯誤就查看該課「常見錯誤」以及對應 `CHEATSHEET.md`。
4. 若要使用 Xcode Playground／真實 App 專案也可以，但 Mac 教材預設為 **Swift Playgrounds**；主要使用 iPad 請依照 **③** [`ipad/`](ipad/)。
5. 進階第 05 課如果 Playgrounds 對外網有限制，用課文裡面的 **mock** 路徑照樣練 `async/await`。

---

## 完成標準

**基礎**

- [ ] B01–B08 code 都能成功執行
- [ ] 能夠解釋 `let` vs `var`、Optional、`if let`／`guard let`
- [ ] 能夠撰寫簡單 `func`、`struct`、`enum`

**進階**

- [ ] 八課 code 都能成功執行（或 mock 路徑能成功執行）
- [ ] Capstone Todo：可以加、勾選完成、刪、計未完成數量
- [ ] 能夠自己開 App playground、加 Swift File、用 `@Observable`

完成之後可以考慮：搬去 Xcode、接真 API、或者同 Telegram／Bootstrap 後端打通——那些是下一階段，不在這套範圍。
