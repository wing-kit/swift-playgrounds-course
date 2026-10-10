# B04 · Operators, `if` / `else`, `switch`, `guard` intro (iPad · Blank)

**Device:** iPad · Swift Playgrounds  
**Playground type:** Blank / plain program output  
**Time:** ~20 minutes  
**Goal:** Branch with comparison/logic operators; use `switch`; meet `guard` (early exit).

---

## Steps (iPad)

1. File browser → **＋** → **Blank** (or reuse the previous Blank).
2. Paste the code below → press **▶**.
3. Follow any lesson-specific tip below.
4. Do the exercises; dismiss the keyboard if it covers results.

**Tip:** Change `score` a few times and press ▶ after each change — iPad does not always auto-rerun.

---

## Full code (paste-ready)

```swift
import Foundation

let score = 86
let hasMakeup = false

// MARK: - 比較同邏輯
print(score >= 60)
print(score >= 80 && score < 90)
print(hasMakeup || score >= 60)

// MARK: - if / else if / else
if score >= 90 {
    print("甲")
} else if score >= 80 {
    print("乙")
} else if score >= 60 {
    print("丙")
} else {
    print("不及格")
}

let passLabel = score >= 60 ? "及格" : "不及格"
print(passLabel)

// MARK: - switch
let gradeLetter = "B"
switch gradeLetter {
case "A":
    print("優秀")
case "B", "C":
    print("良好／尚可")
case "D":
    print("及格邊緣")
default:
    print("未知等級")
}

switch score {
case 90...100:
    print("區間：優")
case 60..<90:
    print("區間：中")
default:
    print("區間：低")
}

// MARK: - guard 入門
func checkScore(_ value: Int) {
    guard value >= 0, value <= 100 else {
        print("分數不合理：\(value)")
        return
    }
    print("接受分數：\(value)")
}

checkScore(86)
checkScore(-3)
```

Matching snippet: `snippets/B04-control-flow.swift`

---

## Exercises

1. Use `if` on an `age` ≥ 18 to print "adult" / "minor".
2. `switch` an `Int` day (1…7) to print Monday–Sunday (use `default`).
3. Write `func sayHi(_ name: String)` with `guard !name.isEmpty else { return }` to reject empty strings.

---

## Common mistakes

| Problem | Fix |
|------|------|
| Changed score but output stale | Press **▶** again on iPad |
| Using `=` for comparison | Comparison is `==`; assignment is `=` |
| Non-exhaustive `switch` | Cover all cases or add `default` |
| `guard` without `return` | `else` must leave the current scope |

---

## Pass criteria

You see grades, ranges, and `guard` rejecting a negative score. Go to B05.
