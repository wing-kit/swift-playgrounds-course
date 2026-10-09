# B08 · struct、enum、protocol 淺嚐（Blank）→ 接 SwiftUI

**Playground 類型：** Blank  
**時間：** ~25 分鐘  
**目標：** 用 `struct` 包資料同方法；用 `enum` 表達有限狀態；淺嚐 `protocol`。為進階 SwiftUI（`View` 本身係 protocol）打底。

---

## 步驟

1. Blank，貼 code，▶ 跑。
2. 改 `Student` 分數，睇 `grade` 點變。
3. 做練習。做完就準備開進階課。

---

## 完整 code（可貼）

```swift
import Foundation

// MARK: - struct（值類型：適合模型）
struct Student {
    var name: String
    var score: Int

    var isPass: Bool {
        score >= 60
    }

    func summary() -> String {
        "\(name)：\(score) 分（\(isPass ? "及格" : "不及格")）"
    }

    mutating func bonus(_ points: Int) {
        score += points
    }
}

var wk = Student(name: "Wing Kit", score: 88)
print(wk.summary())
wk.bonus(5)
print(wk.summary())

// MARK: - enum
enum Grade: String {
    case a = "優"
    case b = "良"
    case c = "可"
    case f = "不及格"
}

func grade(for score: Int) -> Grade {
    switch score {
    case 90...100: return .a
    case 80..<90: return .b
    case 60..<80: return .c
    default: return .f
    }
}

let g = grade(for: wk.score)
print("等級：\(g.rawValue)")

// 帶關聯值嘅 enum（進階常用）
enum LoadState {
    case idle
    case loading
    case ok(String)
    case fail(String)
}

func describe(_ state: LoadState) -> String {
    switch state {
    case .idle: return "閒置"
    case .loading: return "載入中…"
    case .ok(let msg): return "成功：\(msg)"
    case .fail(let err): return "失敗：\(err)"
    }
}

print(describe(.loading))
print(describe(.ok("已讀 3 課")))

// MARK: - protocol 淺嚐（SwiftUI 嘅 View 就係 protocol）
protocol Describable {
    var summary: String { get }
}

struct Course: Describable {
    var title: String
    var minutes: Int
    var summary: String {
        "\(title)（\(minutes) 分）"
    }
}

let course = Course(title: "Swift 基礎", minutes: 25)
print(course.summary)

func printSummary(_ item: Describable) {
    print("→ \(item.summary)")
}
printSummary(course)

print("""
——
基礎完。下一步：
1) 可選溫習 ../lessons/01-basics-refresh.md
2) 直接開 App：../lessons/02-swiftui-app.md
""")
```

對應 snippet：`snippets/B08-structs-enums.swift`

---

## 練習

1. 為 `Student` 加 `var email: String`，並改 `summary()` 一併印出。
2. 擴充 `Grade`，加 `case d`，同對應 `switch` 分支。
3. 令另一個 struct（例如 `Teacher`）都 conform `Describable`，丟入 `printSummary`。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| struct 方法入面改 `self` 屬性 | 方法要標 `mutating` |
| `switch` enum 漏 case | 必須 exhaustive，或者 `default` |
| protocol 要求嘅屬性唔齊 | 實作齊 `get`（同如有要求嘅方法） |

---

## 過關

見到 Student summary、Grade、LoadState、protocol 輸出。  
**基礎軌道完成** → 開 `../README.md` 跟進階；建議下一課 **`../lessons/02-swiftui-app.md`**（想綜合測驗先做 `01-basics-refresh`）。
