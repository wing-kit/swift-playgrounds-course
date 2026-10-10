# B05 · Loops, ranges, arrays (Blank)

**Playground type:** Blank  
**Time:** ~20 minutes  
**Goal:** Use `for-in` / `while`; know `...` and `..<`; create and mutate arrays.

---

## Steps

1. Blank, paste code, press ▶.
2. Change the array contents and run again.
3. Do the exercises.

---

## Full code (paste-ready)

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

Matching snippet: `snippets/B05-loops-arrays.swift`

---

## Exercises

1. With `for i in 1...10`, print only even numbers (hint: `i % 2 == 0`).
2. Make `var scores = [80, 90, 70]`, `append` 95, then sum (e.g. `scores.reduce(0, +)`).
3. Use `while` to add from 1 until the total exceeds 100, then print the last value.

---

## Common mistakes

| Problem | Fix |
|------|------|
| Mutating a `let` array | Array must be `var` to `append` |
| Index out of range | Check `.count`; indices start at 0 |
| Misusing infinite `1...` | Prefer `1...n` or a collection in `for` |

---

## Pass criteria

You see the countdown, topic list, and lengths. Go to B06.
