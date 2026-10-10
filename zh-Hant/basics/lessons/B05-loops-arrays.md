# B05 · 迴圈、範圍、陣列（Blank）

**Playground 類型：** Blank  
**時間：** ~20 分鐘  
**目標：** 用 `for-in`／`while`；識 `...` 同 `..<`；會建立並修改陣列。

---

## 步驟

1. Blank，貼上程式碼，▶ 跑。
2. 修改陣列內容，再執行。
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

// 過濾／對應（預告下幾課／進階會多用）
let lengths = topics.map { $0.count }
print("各長度：\(lengths)")

let shortOnes = topics.filter { $0.count <= 5 }
print("短字：\(shortOnes)")
```

對應 snippet：`snippets/B05-loops-arrays.swift`

---

## 練習

1. 用 `for i in 1...10` 只印出偶數（提示：`i % 2 == 0`）。
2. 做一個 `var scores = [80, 90, 70]`，`append` 一個 95，再計算總和（可用 `scores.reduce(0, +)`）。
3. 用 `while` 從 1 累加到超過 100 便停止，印出最後的數字。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| 改 `let` 陣列的元素／長度 | 陣列須為 `var` 才能 `append` |
| index out of range | 先查看 `.count`；下標從 0 開始 |
| `1...` 無限範圍誤用 | 一般 `for` 使用 `1...n` 或集合 |

---

## 過關標準

看到倒數、主題列表、長度；進入 B06。
