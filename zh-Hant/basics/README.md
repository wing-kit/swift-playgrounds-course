# Swift Playgrounds（Mac）基礎教材

專為 **Wing Kit Leung** 而設：從零開始在 **Swift Playgrounds Mac app** 學 Swift 語言核心。全部課程使用 **Blank** playground（`print` 查看結果），不必再開啟啟 SwiftUI。

語氣：繁體中文書面語，步驟清楚，每課附完整可貼上的程式碼、練習、常見錯誤。

完成這套之後，去上一層 **進階教材**（`../lessons/`）：
- 想再溫一次綜合：開 `../lessons/01-basics-refresh.md`
- 已經熟基礎：可直接跳 `../lessons/02-swiftui-app.md` 開始 SwiftUI

---

## 如何開始

1. Mac App Store 裝 **Swift Playgrounds**（免費）。
2. 開 app → **新建 Playground → Blank**（基礎八課全部用 Blank）。
3. 清除預設範例（如果有），貼 `lessons/B0X-….md` 裡面的「完整 code」。
4. 按 ▶，在結果面板查看 `print` 輸出。
5. `snippets/` 裡面是同一份程式碼 的 `.swift` 純文字，方便一次複製。

> 注意：這套是**教材**，不會遠端修改你的 Mac。全部在你本機 Playgrounds 自行貼上、自行執行。

---

## 課程地圖（建議順序）

| # | 檔案 | 主題 | Playground | 估計時間 |
|---|------|------|------------|----------|
| B01 | `lessons/B01-hello-print.md` | `print`、註解、第一行程式 | Blank | ~15 分 |
| B02 | `lessons/B02-let-var-types.md` | `let`／`var`、型別、型別推斷 | Blank | ~20 分 |
| B03 | `lessons/B03-strings.md` | 字串、插值、多行字串 | Blank | ~15 分 |
| B04 | `lessons/B04-control-flow.md` | 運算子、`if`／`else`、`switch`、`guard` 入門 | Blank | ~20 分 |
| B05 | `lessons/B05-loops-arrays.md` | 迴圈、範圍、陣列 | Blank | ~20 分 |
| B06 | `lessons/B06-collections-optionals.md` | 字典、集合、Optional | Blank | ~25 分 |
| B07 | `lessons/B07-functions-closures.md` | 函式、參數、回傳值、closure 入門體驗 | Blank | ~25 分 |
| B08 | `lessons/B08-structs-enums.md` | struct、enum、protocol 入門體驗 → 接 SwiftUI | Blank | ~25 分 |

總計約 **2.5–3 小時**（可分成數天完成）。

---

## 資料夾結構

```
basics/
├── README.md              ← 你而家睇緊呢份
├── CHEATSHEET.md          ← 基礎語法速查
├── lessons/
│   ├── B01-hello-print.md
│   ├── B02-let-var-types.md
│   ├── B03-strings.md
│   ├── B04-control-flow.md
│   ├── B05-loops-arrays.md
│   ├── B06-collections-optionals.md
│   ├── B07-functions-closures.md
│   └── B08-structs-enums.md
└── snippets/
    ├── B01-hello-print.swift
    ├── B02-let-var-types.swift
    ├── …
    └── B08-structs-enums.swift
```

---

## 學習建議

1. **跟 B01→B08 順序**：後面課程會用到前面的型別與語法。
2. **每課做完「練習」**再進入下一課。
3. 遇到錯誤就查看該課「常見錯誤」同 `CHEATSHEET.md`。
4. 基礎完成 → 開 `../README.md` 繼續進階（建議從第 02 課開始，或先做進階 01 作為綜合測驗）。

---

## 完成標準

- [ ] B01–B08 code 都能成功執行
- [ ] 能夠自己解釋 `let` vs `var`、Optional、`if let`／`guard let`
- [ ] 能夠撰寫簡單 `func`、`struct`、`enum`
- [ ] 可以開始進階第 02 課（SwiftUI App）

完成之後：`../lessons/02-swiftui-app.md` 開始。
