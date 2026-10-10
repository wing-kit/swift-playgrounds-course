# 01 · Basics refresh (Blank)

**Playground type:** Blank  
**Time:** ~15 minutes  
**Goal:** Confirm you are solid on `let` / `var`, string interpolation, `print`, simple functions, and optionals — later lessons will not re-explain these.

---

## Steps

1. Open Swift Playgrounds → **New → Blank**.
2. Clear any default sample, paste the “Full code” below.
3. Press ▶ and confirm output in the results pane.
4. Do the three exercises.

---

## Full code (paste-ready)

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

Matching snippet: `snippets/01-basics-refresh.swift`

---

## Exercises

1. Add `enum Grade { case a, b, c }` and write `grade(for score: Double) -> Grade`.
2. Use `switch` to print a short English label for each grade.
3. Change `topics` to `[String: Int]` (topic → estimated minutes) and print with `for (k, v) in …`.

---

## Common mistakes

| Problem | Fix |
|------|------|
| `Cannot assign to value: 'course' is a 'let' constant` | `let` cannot change — use `var` |
| Missing `\` in strings | Interpolation is `"\(x)"`, not `"{x}"` |
| Concatenating Optional with String | Unwrap with `if let` / `??` / `!` (avoid `!`) |

---

## Pass criteria

Results pane shows greeting, topic list, and average; exercises 1–3 self-check OK → go to lesson 02.
