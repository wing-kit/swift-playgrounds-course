# 01 · 基礎速溫（iPad · Blank）

**裝置：** iPad  
**Playground 類型：** Blank／純程式輸出  
**時間：** ~15 分鐘  
**目標：** 確認基礎語法；後面進階唔再重複解釋。

---

## 步驟（iPad）

1. Swift Playgrounds → 文件瀏覽器 → **＋** → **Blank**。
2. 清走預設 → 貼完整 code（三指貼上／外接鍵盤）。
3. **▶**，掃結果面板確認輸出。
4. 做練習三條。

---

## 完整 code（可貼）

```swift
import Foundation

// MARK: - 常數同變數
let course = "Swift Playgrounds"
var lesson = 1
lesson += 0

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

1. 加 `enum Grade { case a, b, c }`，寫 `grade(for score: Double) -> Grade`。
2. 用 `switch` 印每個 grade 嘅中文說明。
3. 將 `topics` 改成 `[String: Int]`，用 `for (k, v) in …` 印出。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| `let` constant | 改用 `var` |
| 插值唔出 | 檢查反斜線插值語法 |
| Optional 直接加字串 | 先 `if let`／`??` |
| 冇 ▶ | 要打開 playground，唔好停文件列表 |

---

## 過關

見到問候、主題、平均分 → 第 02 課開 **App Playground**。
