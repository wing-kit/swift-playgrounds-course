# B02 · `let`／`var`、型別、型別推斷（iPad · Blank）

**裝置：** iPad  
**Playground 類型：** Blank  
**時間：** ~20 分鐘  
**目標：** 分清常數與變數；認識基本型別；明白型別推斷。

---

## 步驟（iPad）

1. 文件瀏覽器 **＋** 新建 Blank，或沿用 B01 個檔（可長按縮圖 → 複製一份改名 `B02`）。
2. 貼上下方 code → **▶**。
3. 試看取消註解 `appName = "Xcode"` 嗰行，睇錯誤點顯示（通常是紅字／行旁標記）；再註解返。
4. 完成練習。

---

## 完整程式碼（可直接貼上）

```swift
import Foundation

// MARK: - let（常數）同 var（變數）
let appName = "Swift Playgrounds"
var lesson = 2
lesson = 2

print("App：\(appName)，第 \(lesson) 課")

// MARK: - 明確標型
let year: Int = 2026
let title: String = "基礎 B02"
let pi: Double = 3.14159
let isMac: Bool = true

print(year, title, pi, isMac)

// MARK: - 型別推斷
let count = 10
let price = 19.9
let label = "HKD"
let ready = false

print(type(of: count), type(of: price), type(of: label), type(of: ready))

// MARK: - 簡單運算
var score = 80
score += 15
let passed = score >= 60
print("分數 \(score)，及格？\(passed)")
```

對應 snippet：`snippets/B02-let-var-types.swift`

---

## 練習

1. 宣告 `var lives = 3`，減 1，再 `print`。
2. 寫 `let temperature: Double = 36.5`，再用型別推斷寫 `let unit = "°C"`。
3. 將 `passed` 改成明確型別：`let passed: Bool = …`。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| `is a 'let' constant` | 若要修改請用 `var` |
| `Int` 同 `Double` 混合相加 | `Double(count) + price` |
| 螢幕細睇不清錯誤 | 輕觸紅標記睇完整訊息；橫向放置 |

---

## 過關標準

看到 App 名、型別、分數結果；明白為什麼不可更改 `let` → B03。
