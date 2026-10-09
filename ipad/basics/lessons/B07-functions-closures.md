# B07 · 函式、參數、回傳、closure 淺嚐（iPad · Blank）

**裝置：** iPad  
**Playground 類型：** Blank  
**時間：** ~25 分鐘  
**目標：** 寫 `func`；輕試 closure 同 `map`／`filter`。

---

## 步驟（iPad）

1. 開 Blank → 貼 code → **▶**。
2. 改 `greet(..., excited:)` 再跑。
3. 做練習。closure 短寫 `{ $0 * 2 }` 喺螢幕鍵盤打 `$` 可能要切符號頁。

---

## 完整 code（可貼）

```swift
import Foundation

// MARK: - 基本函式
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}
print(add(3, 5))

func greet(_ name: String, excited: Bool = false) -> String {
    let base = "你好，\(name)"
    return excited ? base + "！" : base
}
print(greet("Wing Kit"))
print(greet("Wing Kit", excited: true))

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

let evens = nums.filter { $0 % 2 == 0 }
print(evens)

let sum = nums.reduce(0) { partial, n in
    partial + n
}
print("sum=\(sum)")
```

對應 snippet：`snippets/B07-functions-closures.swift`

---

## 練習

1. 寫 `func average(_ nums: [Double]) -> Double?`，空陣列 return `nil`。
2. 寫 `func label(score: Int) -> String`，回傳「優／中／低」。
3. 用 `map` 將 `["a","bb","ccc"]` 變成長度陣列。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| 參數名唔對 | 睇外部名；`_` 代表呼叫時唔寫名 |
| closure 推斷失敗 | 先寫長版再縮短 |
| 多行漏 `return` | 多行程式體要寫 `return` |

---

## 過關

見到 greet、minMax、map／filter → B08。
