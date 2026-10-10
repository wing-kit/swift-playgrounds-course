# B03 · Strings, interpolation, multiline strings (iPad · Blank)

**Device:** iPad · Swift Playgrounds  
**Playground type:** Blank / plain program output  
**Time:** ~15 minutes  
**Goal:** Get comfortable with concatenation and interpolation; write multiline strings.

---

## Steps (iPad)

1. File browser → **＋** → **Blank** (or reuse the previous Blank).
2. Paste the code below → press **▶**.
3. Follow any lesson-specific tip below.
4. Do the exercises; dismiss the keyboard if it covers results.

**Tip:** When typing interpolations, the on-screen keyboard may need the symbols page to find `\\`; a hardware keyboard is faster.

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
print("長度：\(raw.count)")
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
