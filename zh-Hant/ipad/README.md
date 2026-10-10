# Swift Playgrounds（iPad）獨立教材

專為 **Wing Kit Leung** 而設：在 **iPad 版 Swift Playgrounds**（App Store）從零學到一個可執行的 Mini Todo App。

語氣：繁體中文書面語。這套與 Mac 軌道（repo 根目錄 `basics/`、`lessons/`）**平行、獨立**——步驟全部按 iPad 觸控介面重寫，並非要求你跟隨 Mac 教材。

Swift **語法同練習 code 與 Mac 版對齊**；差異只在如何開檔、執行、加檔、分享。

---

## 同 Mac 軌道如何對照

| | ① Mac 基礎／進階 | ③ iPad（你現在這套） |
|--|------------------|---------------------|
| App | Mac App Store「Swift Playgrounds」 | **iPad** App Store 同一名 |
| 操作 | 滑鼠／觸控板、鍵盤為主 | **手指輕觸**；外接鍵盤可選 |
| 專案形態 | Blank／App playground | 以 **App Playground（`.swiftpm`）** 為主；Blank 用來練習 `print` |
| 預覽 | 視窗右／下 | iPad 上可能是 **右半／下半 Preview**，或全螢幕切換 |
| 下一步 | 易搬去 Xcode | **沒有完整 Xcode**；想上 TestFlight／真 App 要轉 Mac＋Xcode |
| SPM | File → Add Package | iPad 上 **支援有限／介面不同**；本課程不依賴第三方 package |

**建議：揀一條主軌道跟完。**  
- 主要使用 iPad → 跟這套 `ipad/`（B01→B08→進階 01→08）。  
- 主要使用 Mac → 跟 repo 根目錄。  
兩邊 code 互通，之後可以 AirDrop `.swiftpm`／檔案互傳，但課文步驟不要混用。

---

## 如何開始（iPad）

1. iPad App Store 搜 **Swift Playgrounds**，安裝（免費；要較新 iPadOS）。
2. 開 app → 看到 **文件瀏覽器／My Playgrounds**（「我的 Playground」）。
3. 右上角 **＋** →：
   - 基礎八課：**App Playground** 裡面用 Blank／純程式頁，或者揀畫廊的 **Blank**（視版本標籤；目標是有 ▶ 同結果輸出）。
   - 進階 SwiftUI：**App**／**App Playground**（會產生 `.swiftpm` 包）。
4. 橫向放置 iPad 較舒服：一邊 code、一邊 Preview／結果。直向放置可以按工具列切換編輯／預覽。
5. （可選）外接鍵盤：`⌘↩` 或工具列 ▶ 跑（視版本）。
6. 每課 `snippets/` 是同一份 `.swift`，可用 **檔案** app 開、複製，或者 Mac 睇完 AirDrop 過來。

> 注意：教材不會遠端修改你的 iPad。全部本機貼上、本機執行。

### App Playground（`.swiftpm`）vs 舊 Playground Book

| | App Playground | 舊 playground book（較少見） |
|--|----------------|------------------------------|
| 副檔名／形態 | `.swiftpm` 包 | `.playgroundbook` |
| 用途 | 目前主推：SwiftUI App、多檔 | 早期 Learn to Code／書本式 |
| 本課程 | **一律用 App Playground／Blank** | 不教授舊 book 流程 |

檔案實際位置（一般）：**檔案** app → **在我的 iPad** → **Swift Playgrounds**（或 iCloud「Swift Playgrounds」若開了同步）。

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

## ② 進階課程地圖 → [`lessons/`](lessons/)

| # | 檔案 | 主題 | 類型 | 時間 |
|---|------|------|------|------|
| 01 | `lessons/01-basics-refresh.md` | 綜合快速複習 | Blank／純程式 | ~15 分 |
| 02 | `lessons/02-swiftui-app.md` | App、`@State`、Button | App Playground | ~20 分 |
| 03 | `lessons/03-multi-file.md` | 側邊欄多檔 | App（多檔） | ~20 分 |
| 04 | `lessons/04-list-navigation.md` | List、NavigationStack | App | ~25 分 |
| 05 | `lessons/05-async-await.md` | Task、mock／網絡 | Blank 或 App | ~25 分 |
| 06 | `lessons/06-codable-models.md` | Codable | Blank | ~20 分 |
| 07 | `lessons/07-observable-state.md` | `@Observable` | App | ~25 分 |
| 08 | `lessons/08-capstone-mini-todo.md` | Mini Todo | App（多檔） | ~30 分 |

速查：[`CHEATSHEET.md`](CHEATSHEET.md)（iPad 手勢／選單）

---

## 建議學習路徑

1. 完成 `basics/` B01→B08  
2. （可選）進階 `01` 綜合測驗  
3. 從 `02` 做到 `08` Capstone  
4. 分享：工具列 **分享** → AirDrop／「儲存到檔案」；之後可在 Mac 開同一個 `.swiftpm`

已經會基礎 → 可跳去 `lessons/02`。

---

## 資料夾結構

```
ipad/
├── README.md                 ← 你而家睇緊呢份
├── CHEATSHEET.md             ← iPad UI／手勢速查
├── basics/
│   ├── README.md
│   ├── CHEATSHEET.md
│   ├── lessons/B01…B08.md
│   └── snippets/B01…B08.swift
├── lessons/                  ← 進階
│   ├── 01-….md … 08-….md
└── snippets/                 ← 進階 .swift
```

---

## iPad 專屬提醒（全課程適用）

- **螢幕細／分割**：用橫向；需要時開 **Stage Manager**（外接螢幕／多窗，可選）把文件 app 同 Playgrounds 並排抄 code。  
- **無 Xcode**：沒有 Instruments、完整 Simulator 矩陣、複雜 Signing；課程目標是學語言＋SwiftUI，不是上架。  
- **SPM**：本課程 snippets **零第三方依賴**；不要在 iPad 卡住等加 package。  
- **連外網**：第 05 課有 mock；行動網路／防火牆阻擋 HTTP 都不影響過關標準。  
- **鍵盤**：螢幕鍵盤夠用；外接鍵盤加快寫 code，但所有步驟都當「得手指」都做得到。

---

## 完成標準

**基礎**

- [ ] B01–B08 在 iPad 能成功執行  
- [ ] 識 `let`／`var`、Optional、`func`、`struct`／`enum`  
- [ ] 懂得自己在文件瀏覽器開新 Blank／App Playground  

**進階**

- [ ] 八課能成功執行（05 可用 mock）  
- [ ] Capstone：加、勾選、刪除、計算剩餘  
- [ ] 識側邊欄加 Swift 檔、用 Preview 查看 UI  
- [ ] 識用分享／檔案 app 備份 `.swiftpm`  
