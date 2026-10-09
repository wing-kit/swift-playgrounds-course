# B02 · `let`／`var`、型別、型別推斷（Blank）

**Playground 類型：** Blank  
**時間：** ~20 分鐘  
**目標：** 分清常數同變數；認識 `Int`／`String`／`Double`／`Bool`；明白編譯器可以推斷型別。

---

## 步驟

1. 新建（或沿用）**Blank** playground。
2. 貼下面 code，▶ 跑。
3. 刻意試改 `let`（應報錯），再改返 `var` 理解差異。
4. 做練習。

---

## 完整 code（可貼）

```swift
import Foundation

// MARK: - let（常數）同 var（變數）
let appName = "Swift Playgrounds"  // 之後唔改得
var lesson = 2
lesson = 2  // OK：var 可以重新賦值
// appName = "Xcode"  // ← 打開呢行會錯：let 唔改得

print("App：\(appName)，第 \(lesson) 課")

// MARK: - 明確標型
let year: Int = 2026
let title: String = "基礎 B02"
let pi: Double = 3.14159
let isMac: Bool = true

print(year, title, pi, isMac)

// MARK: - 型別推斷（唔寫 : Type 都得）
let count = 10          // Int
let price = 19.9        // Double
let label = "HKD"       // String
let ready = false       // Bool

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
2. 寫 `let temperature: Double = 36.5`，再用推斷寫 `let unit = "°C"`。
3. 將 `passed` 改成用明確型別：`let passed: Bool = …`。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| `Cannot assign to value: … is a 'let' constant` | 要改就用 `var` |
| `Int` 同 `Double` 混加 | 先轉換：`Double(count) + price` |
| 以為 `let` 入面嘅物件內容永遠唔變 | `let` 綁住嘅係變數本身；之後會學 class／struct 差異 |

---

## 過關

見到 App 名、型別 `print`、分數及格結果；明白點解唔改得 `let`。進入 B03。
