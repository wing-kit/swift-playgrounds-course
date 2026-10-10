# B03 · Strings, interpolation, multiline strings (Blank)

**Playground type:** Blank  
**Time:** ~15 minutes  
**Goal:** Get comfortable with concatenation and interpolation; write multiline strings.

---

## Steps

1. Blank playground, paste code, press ▶.
2. Change variables inside interpolations and run again to see output change.
3. Do the exercises.

---

## Full code (paste-ready)

```swift
import Foundation

let name = "Wing Kit"
let lesson = 3

// MARK: - 插值（最常用）
let line = "你好，\(name)！而家係 B0\(lesson)。"
print(line)

// MARK: - 用 + 拼接（型別要一致）
let a = "Swift"
let b = "Playgrounds"
print(a + " " + b)

// MARK: - 常用字串操作
let raw = "  hello SWIFT  "
print(raw.trimmingCharacters(in: .whitespaces).lowercased())
print("長度：\(raw.count)")  // 注意：含空格
print(a.hasPrefix("Sw"))
print(b.contains("ground"))

// MARK: - 多行字串
let memo = """
今日重點：
1. 插值
2. 多行字串
3. 小練習
"""
print(memo)

// 多行入面都一樣用插值
let report = """
學員：\(name)
進度：B0\(lesson)
"""
print(report)
```

Matching snippet: `snippets/B03-strings.swift`

---

## Exercises

1. Use interpolation to print "Score: 95/100".
2. Write a three-line multiline string introducing yourself.
3. Check that `"playground".uppercased()` equals `"PLAYGROUND"`.

---

## Common mistakes

| Problem | Fix |
|------|------|
| Interpolation shows literally | Use `"\(x)"`, not `"{x}"` or `"$x"` |
| `+` with Int | Convert first: `"Lesson \(n)"` or `String(n)` |
| Odd multiline indentation | Closing `"""` indentation controls how much leading whitespace is stripped |

---

## Pass criteria

You see the greeting, concatenation, and multiline memo. Go to B04.
