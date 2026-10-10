# Swift basics cheat sheet (Playgrounds Blank)

## Playgrounds actions

| Action | How |
|------|------|
| New Blank | Swift Playgrounds → **New → Blank** |
| Run | Press ▶ |
| See results | `print` output in the results pane |
| Comments | `//` single line; `/* … */` multiline |

All eight basics lessons use **Blank**. Open **App** only when you start advanced.

---

## Constants / variables / types

```swift
let name = "Wing Kit"     // immutable
var score = 0             // mutable
score += 10

let pi: Double = 3.14     // explicit type
let ok = true             // Bool (inferred)
```

Common types: `Int`, `Double`, `String`, `Bool`.

---

## Strings

```swift
let a = "Hello"
let b = "score: \(score)"
let multi = """
line 1
line 2
"""
```

---

## Control flow

```swift
if score >= 60 {
    print("pass")
} else {
    print("fail")
}

switch grade {
case "A": print("excellent")
case "B", "C": print("ok")
default: print("other")
}

guard score >= 0 else {
    print("invalid")
    return
}
```

---

## Loops and arrays

```swift
for i in 1...5 { print(i) }        // inclusive 5
for i in 1..<5 { print(i) }       // exclusive 5
for name in ["a", "b"] { print(name) }

var nums = [1, 2, 3]
nums.append(4)
nums.count
nums[0]
```

---

## Dictionaries / sets / Optional

```swift
var ages = ["WK": 30]
ages["WK"]          // Int? ← Optional

var tags: Set = ["swift", "ios"]
tags.insert("mac")

var nick: String? = nil
print(nick ?? "unset")
if let nick {
    print(nick)
}
```

Avoid force-unwrap `!`; prefer `if let` / `guard let` / `??`.

---

## Functions and closures (quick)

```swift
func greet(_ name: String, excited: Bool = false) -> String {
    excited ? "Hello, \(name)!" : "Hello, \(name)"
}

let doubled = [1, 2, 3].map { $0 * 2 }
```

---

## struct / enum / protocol (quick)

```swift
struct Student {
    var name: String
    var score: Int
}

enum Grade { case a, b, c }

protocol Describable {
    var summary: String { get }
}
```

---

## Common mistakes

| Symptom | Likely cause |
|------|----------|
| `is a 'let' constant` | Assigning to `let` → use `var` |
| Interpolation blank | Use `"\(x)"`, not `"{x}"` |
| Optional + String fail | Unwrap / `??` first |
| `Value of optional type…` | Dictionary lookup, `first`, etc. return Optional |
| `guard` continues after else | `else` must `return` / `throw` |

---

## Lesson map

| Looking for | Lesson |
|------|-----|
| print / comments | B01 |
| let / var / types | B02 |
| Strings | B03 |
| if / switch / guard | B04 |
| Loops / arrays | B05 |
| Dictionaries / Optional | B06 |
| Functions / closures | B07 |
| struct / enum | B08 |
| Next: SwiftUI | `../lessons/02-swiftui-app.md` |
