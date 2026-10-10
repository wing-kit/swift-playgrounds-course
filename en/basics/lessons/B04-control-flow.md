# B04 · Operators, `if` / `else`, `switch`, `guard` intro (Blank)

**Playground type:** Blank  
**Time:** ~20 minutes  
**Goal:** Branch with comparison/logic operators; use `switch`; meet `guard` (early exit).

---

## Steps

1. Blank, paste code, press ▶.
2. Change `score` a few times and watch branches switch.
3. Do the exercises.

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

// 三元運算（短分支）
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

// 區間 match
switch score {
case 90...100:
    print("區間：優")
case 60..<90:
    print("區間：中")
default:
    print("區間：低")
}

// MARK: - guard 入門（函式入面提早離開）
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
| Using `=` for comparison | Comparison is `==`; assignment is `=` |
| Non-exhaustive `switch` | Cover all cases or add `default` |
| `guard` without `return` | `else` must leave the current scope |

---

## Pass criteria

You see grades, ranges, and `guard` rejecting a negative score. Go to B05.
