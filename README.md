# Swift Playgrounds（Mac）教材

專為 **Wing Kit Leung** 而設：喺 **Swift Playgrounds Mac app**（唔一定要開 Xcode）由零學到一個可跑嘅 Mini Todo App。

語氣：粵語書面語，步驟清楚，每課附完整可貼 code 同練習。

---

## 兩條軌道

| 軌道 | 路徑 | 適合 | Playground |
|------|------|------|------------|
| **① 基礎（先做）** | [`basics/`](basics/) | 未熟 Swift 語法、想由 `print` 起 | 全部 **Blank** |
| **② 進階** | 下面「進階課程地圖」／`lessons/` | 識基礎，要學 SwiftUI／async／Todo | Blank 或 **App** |

**建議路徑**

1. 完成 [`basics/README.md`](basics/)（B01–B08）
2. （可選）溫習 `lessons/01-basics-refresh.md`
3. 由 `lessons/02-swiftui-app.md` 起做進階，做到 `08` Capstone

已經識 `let`／Optional／func／struct → 可以跳過 basics，直接由進階 01 或 02 開始。

---

## 點樣開

1. Mac App Store 裝 **Swift Playgrounds**（免費）。
2. 開 app → **新建 Playground**。
3. 睇每課開頭標明要用 **Blank** 定 **App**：
   - **Blank**：適合 `print`、純邏輯（基礎全套；進階 01、05、06 為主）。
   - **App**：SwiftUI 介面、即時預覽（進階 02–04、07–08 為主）。
4. 將課文入面嘅 code 貼入編輯器，撳 ▶ 跑。
5. 各軌道嘅 `snippets/` 係同一份 code 嘅 `.swift` 純文字，方便一次過複製。

> 注意：呢套係**教材**，唔會遠端改你部 Mac。全部喺你本機 Playgrounds 自己貼、自己跑。

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
| 01 | `lessons/01-basics-refresh.md` | `print`、`let`/`var`、字串插值（綜合速溫） | Blank | ~15 分 |
| 02 | `lessons/02-swiftui-app.md` | App、`@State`、Button、VStack | App | ~20 分 |
| 03 | `lessons/03-multi-file.md` | 拆 View／Model | App（多檔） | ~20 分 |
| 04 | `lessons/04-list-navigation.md` | List、NavigationStack | App | ~25 分 |
| 05 | `lessons/05-async-await.md` | Task、URLSession／mock | Blank 或 App | ~25 分 |
| 06 | `lessons/06-codable-models.md` | Codable 模型 | Blank | ~20 分 |
| 07 | `lessons/07-observable-state.md` | `@Observable` 狀態 | App | ~25 分 |
| 08 | `lessons/08-capstone-mini-todo.md` | Mini Todo 總結 | App（多檔） | ~30 分 |

進階總計約 **2.5–3.5 小時**（可分開幾日做）。速查：[`CHEATSHEET.md`](CHEATSHEET.md)

---

## 資料夾結構

```
swift-playgrounds-course/
├── README.md                 ← 你而家睇緊呢份（總覽）
├── CHEATSHEET.md             ← 進階／SwiftUI 速查
├── basics/                   ← ① 基礎軌道
│   ├── README.md
│   ├── CHEATSHEET.md
│   ├── lessons/B01…B08.md
│   └── snippets/B01…B08.swift
├── lessons/                  ← ② 進階軌道
│   ├── 01-basics-refresh.md
│   ├── …
│   └── 08-capstone-mini-todo.md
└── snippets/                 ← 進階 snippets
    ├── 01-basics-refresh.swift
    └── …
```

---

## 學習建議

1. **新手**：basics B01→B08 → 進階 02（可選做 01 測驗）。
2. **每課做完「練習」**先跳下一課——練習唔係考你，係逼你改幾行先記得。
3. 撞錯就睇該課「常見錯誤」同對應 `CHEATSHEET.md`。
4. 想用 Xcode Playground／真 App 專案都可以，但教材預設係 **Swift Playgrounds**。
5. 進階第 05 課如果 Playgrounds 對出網有限制，用課文入面嘅 **mock** 路徑照樣練 `async/await`。

---

## 完成標準

**基礎**

- [ ] B01–B08 code 都跑得過
- [ ] 識得解釋 `let` vs `var`、Optional、`if let`／`guard let`
- [ ] 識得寫簡單 `func`、`struct`、`enum`

**進階**

- [ ] 八課 code 都跑得過（或 mock 路徑跑得過）
- [ ] Capstone Todo：可以加、剔完成、刪、計未完成數
- [ ] 識得自己開 App playground、加 Swift File、用 `@Observable`

搞掂之後可以考慮：搬去 Xcode、接真 API、或者同 Telegram／Bootstrap 後端打通——嗰啲係下一階段，唔喺呢套範圍。
