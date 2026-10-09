# 01 · 基礎速溫（Blank）

**Playground 類型：** Blank  
**時間：** ~15 分鐘  
**目標：** 確認 `let`／`var`、字串插值、`print`、簡單函式同 optional 你都熟；後面唔再花時間解釋呢啲。

---

## 步驟

1. 開 Swift Playgrounds → **新建 → Blank**。
2. 清走預設範例（如果有），貼下面「完整 code」。
3. 撳 ▶，喺結果面板確認輸出。
4. 做「練習」三條。

---

## 完整 code（可貼）

```swift
import Foundation

// MARK: - 常數同變數
let course = "Swift Playgrounds"
var lesson = 1
lesson += 0 // 仍然係 1；示範 var 可以改

print("課程：\(course)，第 \(lesson) 課")

// MARK: - 型別同推斷
let score: Double = 95.5
let pass = score >= 60
print("及格？\(pass)")

// MARK: - 陣列同迴圈
let topics = ["print", "let/var", "interpolation"]
for (index, topic) in topics.enumerated() {
    print("\(index + 1). \(topic)")
}

// MARK: - 函式
func greet(_ name: String, excited: Bool = false) -> String {
    let base = "你好，\(name)"
    return excited ? base + "！" : base
}

print(greet("Wing Kit", excited: true))

// MARK: - Optional
var nickname: String? = nil
print(nickname ?? "未設定花名")
nickname = "WK"
if let nickname {
    print("花名：\(nickname)")
}

// MARK: - 小計算
func average(_ numbers: [Double]) -> Double? {
    guard !numbers.isEmpty else { return nil }
    return numbers.reduce(0, +) / Double(numbers.count)
}

print(average([80, 90, 100]) ?? -1)
print(average([]) ?? -1)
```

對應 snippet：`snippets/01-basics-refresh.swift`

---

## 練習

1. 加一個 `enum Grade { case a, b, c }`，寫函式 `grade(for score: Double) -> Grade`。
2. 用 `switch` 印出每個 grade 嘅中文說明。
3. 將 `topics` 改成 `[String: Int]`（主題 → 預計分鐘），用 `for (k, v) in …` 印出。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| `Cannot assign to value: 'course' is a 'let' constant` | `let` 唔改得，要用 `var` |
| 字串少咗 `\` | 插值係 `"\(x)"`，唔係 `"{x}"` |
| Optional 直接加字串 | 先 `if let`／`??`／`!`（少用 `!`） |

---

## 過關

結果面板見到問候、主題列表、平均分；練習 1–3 自測跑得過即可進入第 02 課。
