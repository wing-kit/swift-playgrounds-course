# Swift Playgrounds 速查表（iPad）

專講 **iPad UI／手勢**；Swift 語法速記同 Mac 版一樣，見文末連結。

---

## 開檔同專案

| 動作 | 喺 iPad 點做 |
|------|----------------|
| 安裝 | App Store →「Swift Playgrounds」 |
| 返文件瀏覽器 | 左上角 **＜**／文件圖示，回到 My Playgrounds |
| 新建 | 右上角 **＋** → 揀 **App**（SwiftUI）或 Blank／程式練習用模板 |
| 開舊檔 | 輕觸縮圖；或 **檔案** app → Swift Playgrounds 資料夾 |
| 重新命名 | 長按縮圖 → 重新命名 |
| 刪除 | 長按 → 刪除（可先「儲存到檔案」備份） |

**App Playground（`.swiftpm`）**：而家主推形態，內含多個 `.swift` 檔，適合本課程進階。  
**舊 playground book**：本課程唔用。

---

## 編輯同跑

| 動作 | 點做 |
|------|------|
| 顯示／隱藏側邊欄 | 工具列左上 **側邊欄** 圖示（檔案列表） |
| 開某一檔 | 側邊欄輕觸檔名 |
| 跑 | 工具列 **▶**（外接鍵盤視版本可用 ⌘↩） |
| 睇 `print` | Blank／結果區（可能喺下方或可拖分頁）；App 則主要睇 **Preview** |
| 顯示 Preview | App Playground：工具列 **預覽**／右半畫布；直放可能要撳切換 |
| 停止 | 再撳 ■／停止（若有長任務） |
| 撤銷 | 三指雙點輕觸；或搖一搖 → 還原；外接鍵盤 ⌘Z |
| 選取文字 | 雙擊字 → 拖手柄；三指捏合複製／貼上（系統手勢） |
| 螢幕鍵盤符號 | 撳 `123`／`#+=`；長按鍵睇變音（較少用於 code） |

---

## 多檔（App Playground）

| 動作 | 點做 |
|------|------|
| 加 Swift 檔 | 側邊欄 **＋** → Swift File／SwiftUI View |
| 加資料夾 | 側邊欄 **＋** → Folder（可選） |
| 刪檔 | 側邊欄長按檔名 → 刪除 |
| 同一 module | **唔使** `import` 自己寫嘅檔；只要 `import SwiftUI` 等系統框架 |
| `@main` | 成個 App Playground **只得一個** |

---

## 分享同備份

| 動作 | 點做 |
|------|------|
| 分享 | 工具列 **分享**（方框↑）→ AirDrop／訊息／「儲存到檔案」 |
| 檔案位置 | **檔案** → 喺我的 iPad（或 iCloud Drive）→ **Swift Playgrounds** |
| 去 Mac | AirDrop `.swiftpm` → Mac 用 Swift Playgrounds 或 Xcode 開 |
| 由 Mac 入 iPad | 反向 AirDrop；或 iCloud 同步同一資料夾 |

---

## 同 Mac 版差異（一秒記）

| 項目 | iPad | Mac |
|------|------|-----|
| 指標 | 手指／Apple Pencil（少用） | 滑鼠 |
| Xcode | 無 | 可裝，易銜接 |
| SPM 加依賴 | 有限，本課唔用 | File → Add Package |
| 視窗 | 單 app；可選 Stage Manager | 多視窗自由 |
| Preview | 易被鍵盤擋住 → 收起鍵盤或橫放 | 通常右欄穩定 |

---

## SwiftUI／語法短記（同 Mac）

```swift
@State private var count = 0
Button("+1") { count += 1 }
List(items) { … }
NavigationStack { … }

@Observable
final class Store { var items: [Item] = [] }
```

```swift
Task { await load() }
try JSONDecoder().decode(T.self, from: data)
```

詳情：根目錄 [`../CHEATSHEET.md`](../CHEATSHEET.md)（Mac 進階語法表）同 [`basics/CHEATSHEET.md`](basics/CHEATSHEET.md)。

---

## 常見錯誤（iPad）

| 症狀 | 解法 |
|------|------|
| 搵唔到 ▶ | 確認已打開某個 playground，唔係停喺文件瀏覽器 |
| Preview 空白 | 確認係 **App** 類型；等編譯；收起螢幕鍵盤騰位 |
| 改咗 code Preview 舊 | 再撳 ▶／等自動更新；儲存後重開檔 |
| 加唔到檔 | 側邊欄＋；確認喺 App Playground 唔係單一 Blank 限制 |
| 分享後對方開唔到 | 送成個 `.swiftpm`，唔好只截圖；對方都要有 Playgrounds |
| `@Observable` 報錯 | 更新 iPadOS／Playgrounds；或用課文 ObservableObject 後備 |

---

## 課次對應

| 想查 | 課 |
|------|-----|
| 開 Blank、`print` | basics B01 |
| SwiftUI Button | lessons 02 |
| 側邊欄多檔 | lessons 03 |
| List／導航 | lessons 04 |
| async | lessons 05 |
| JSON | lessons 06 |
| Store | lessons 07 |
| Todo | lessons 08 |
