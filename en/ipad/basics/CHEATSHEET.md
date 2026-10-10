# Swift basics cheat sheet (iPad · Blank)

## iPad Playgrounds actions

| Action | How |
|------|------|
| New Blank | Swift Playgrounds → **＋** → Blank / coding template |
| Run | Toolbar **▶** |
| See results | Results pane `print` (dismiss keyboard if needed) |
| Back to list | Top-left back to file browser |
| Comments | `//`; `/* … */` |

All eight basics lessons use **Blank / plain output**. Open an **App Playground** only for advanced.

Fuller gestures: [`../CHEATSHEET.md`](../CHEATSHEET.md)

---

## Constants / variables / types

```swift
let name = "Wing Kit"
var score = 0
score += 10
let pi: Double = 3.14
```

Common: `Int`, `Double`, `String`, `Bool`.

---

## Strings

```swift
let b = "score: \(score)"
let multi = """
line 1
line 2
"""
```

---

## Control flow

```swift
if score >= 60 { print("pass") } else { print("fail") }

switch grade {
case "A": print("great")
default: print("other")
}

guard score >= 0 else { return }
```

---

## Loops and arrays

```swift
for i in 1...5 { print(i) }
var nums = [1, 2, 3]
nums.append(4)
```

---

## Dictionaries / Optional

```swift
var ages = ["WK": 30]
print(ages["WK"] ?? -1)
var nick: String? = nil
if let nick { print(nick) }
```

---

## Lesson map

Same as Mac basics: B01 `print` → B08 struct/enum. Next: [`../lessons/02-swiftui-app.md`](../lessons/02-swiftui-app.md).
