# B02 · `let` / `var`, types, type inference (Blank)

**Playground type:** Blank  
**Time:** ~20 minutes  
**Goal:** Distinguish constants and variables; know `Int` / `String` / `Double` / `Bool`; understand type inference.

---

## Steps

1. Create (or reuse) a **Blank** playground.
2. Paste the code below and press ▶.
3. Intentionally try changing a `let` (should error), then switch to `var` to see the difference.
4. Do the exercises.

---

## Full code (paste-ready)

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

Matching snippet: `snippets/B02-let-var-types.swift`

---

## Exercises

1. Declare `var lives = 3`, subtract 1, then `print`.
2. Write `let temperature: Double = 36.5`, then inferred `let unit = "°C"`.
3. Rewrite `passed` with an explicit type: `let passed: Bool = …`.

---

## Common mistakes

| Problem | Fix |
|------|------|
| `Cannot assign to value: … is a 'let' constant` | Use `var` if you need to change it |
| Mixing `Int` and `Double` in `+` | Convert first: `Double(count) + price` |
| Thinking object contents inside `let` never change | `let` binds the variable itself; class/struct differences come later |

---

## Pass criteria

You see the app name, type `print`s, and pass/fail score; you understand why `let` cannot be reassigned. Go to B03.
