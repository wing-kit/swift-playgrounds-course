# B05 · 迴圈、範圍、陣列（Blank）

**Playground 類型：** Blank  
**時間：** ~20 分鐘  
**目標：** 用 `for-in`／`while`；識 `...` 同 `..<`；會建立同修改陣列。

---

## 步驟

1. Blank，貼 code，▶ 跑。
2. 改陣列內容，再跑。
3. 做練習。

---

## 完整 code（可貼）

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

1. 用 `for i in 1...10` 只印偶數（提示：`i % 2 == 0`）。
2. 做一個 `var scores = [80, 90, 70]`，`append` 一個 95，再算總和（可用 `scores.reduce(0, +)`）。
3. 用 `while` 由 1 加到超過 100 就停，印最後個數。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| 改 `let` 陣列嘅元素／長度 | 陣列要 `var` 先 `append` |
| index out of range | 先睇 `.count`；下標由 0 起 |
| `1...` 無限範圍誤用 | 一般 `for` 用 `1...n` 或集合 |

---

## 過關

見到倒數、主題列表、長度；進入 B06。
