# B07 · Functions, parameters, return, closures intro (Blank)

**Playground type:** Blank  
**Time:** ~25 minutes  
**Goal:** Write `func` (argument labels, defaults, return); try closures with `map` / `filter`.

---

## Steps

1. Blank, paste code, press ▶.
2. Change `greet`'s default parameter and run again.
3. Do the exercises.

---

## Full code (paste-ready)

```swift
import Foundation

// MARK: - 基本函式
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}
print(add(3, 5))

// 外部名 excited，內部一樣；有預設值
func greet(_ name: String, excited: Bool = false) -> String {
    let base = "你好，\(name)"
    return excited ? base + "！" : base
}
print(greet("Wing Kit"))
print(greet("Wing Kit", excited: true))

// 無回傳 = Void
func logLesson(_ n: Int) {
    print("而家做 B0\(n)")
}
logLesson(7)

// MARK: - 多回傳（tuple）
func minMax(_ nums: [Int]) -> (min: Int, max: Int)? {
    guard let first = nums.first else { return nil }
    var lo = first, hi = first
    for n in nums {
        lo = min(lo, n)
        hi = max(hi, n)
    }
    return (lo, hi)
}
if let mm = minMax([4, 9, 1, 7]) {
    print("min=\(mm.min), max=\(mm.max)")
}

// MARK: - Closure 淺嚐
let nums = [1, 2, 3, 4, 5]
let doubled = nums.map { (x: Int) -> Int in
    return x * 2
}
print(doubled)

// 短寫
let evens = nums.filter { $0 % 2 == 0 }
print(evens)

let sum = nums.reduce(0) { partial, n in
    partial + n
}
print("sum=\(sum)")
```

Matching snippet: `snippets/B07-functions-closures.swift`

---

## Exercises

1. Write `func average(_ nums: [Double]) -> Double?` returning `nil` for an empty array.
2. Write `func label(score: Int) -> String` returning "high / mid / low" with `if`.
3. Use `map` so `["a","bb","ccc"]` becomes an array of string lengths.

---

## Common mistakes

| Problem | Fix |
|------|------|
| Wrong argument label at call site | Check external names; `_` means no label at the call |
| Closure type inference fails | Start with the long form `{ (x: Int) -> Int in … }` then shorten |
| Missing `return` in multi-line body | Single-line can omit `return`; multi-line needs it |

---

## Pass criteria

You see greet, minMax, and map/filter. Go to B08.
