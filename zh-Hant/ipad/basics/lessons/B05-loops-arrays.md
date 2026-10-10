# B05 · 迴圈、範圍、陣列（iPad · Blank）

**裝置：** iPad  
**Playground 類型：** Blank  
**時間：** ~20 分鐘  
**目標：** `for-in`／`while`；`...` 同 `..<`；建立同修改陣列。

---

## 步驟（iPad）

1. 開 Blank → 貼上程式碼 → **▶**。
2. 改 `topics` 內容再跑；結果區會較長，用兩指向上掃結果面板。
3. 完成練習。

---

## 完整程式碼（可直接貼上）

```swift
import Foundation

// MARK: - 範圍
print("閉合 1...3")
for i in 1...3 {
    print(i)
}

print("半開 1..<3")
for i in 1..<3 {
    print(i)
}

// MARK: - while
var n = 3
while n > 0 {
    print("倒數 \(n)")
    n -= 1
}

// MARK: - 陣列
var topics = ["print", "let/var", "string"]
topics.append("loops")
topics += ["arrays"]
print("共 \(topics.count) 個主題")
print("第一個：\(topics[0])")

for (index, topic) in topics.enumerated() {
    print("\(index + 1). \(topic)")
}

let lengths = topics.map { $0.count }
print("各長度：\(lengths)")

let shortOnes = topics.filter { $0.count <= 5 }
print("短字：\(shortOnes)")
```

對應 snippet：`snippets/B05-loops-arrays.swift`

---

## 練習

1. 用 `for i in 1...10` 只印出偶數（`i % 2 == 0`）。
2. `var scores = [80, 90, 70]`，`append` 95，再用 `reduce(0, +)` 求總和。
3. 用 `while` 從 1 累加到超過 100 便停止，印出最後的數字。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| 對 `let` 陣列 `append` | 陣列要 `var` |
| index out of range | 下標由 0；先查看 `.count` |
| 輸出太多以為當機 | 等 ▶ 完；掃結果面板 |

---

## 過關標準

看到倒數、主題列表 → B06。
