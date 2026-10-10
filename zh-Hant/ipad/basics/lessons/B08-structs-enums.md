# B08 · struct、enum、protocol 入門體驗（iPad · Blank）→ 接 SwiftUI

**裝置：** iPad  
**Playground 類型：** Blank  
**時間：** ~25 分鐘  
**目標：** `struct`／`enum`／`protocol` 打基礎；之後開 **App Playground** 學 SwiftUI。

---

## 步驟（iPad）

1. 開 Blank → 貼上程式碼 → **▶**。
2. 改 `Student` 分數，睇 `grade` 如何變化。
3. 完成練習。做完用分享按鈕備份這個基礎 playground（AirDrop／儲存到檔案）。
4. 下一課會在文件瀏覽器 **＋** 開 **App**（不再只用 Blank）。

---

## 完整程式碼（可直接貼上）

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

// MARK: - protocol 淺嚐
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

> 課文末 `print` 若提到 `../lessons/…`，在 **iPad 軌道**請改睇：`ipad/lessons/01-basics-refresh.md` 同 `ipad/lessons/02-swiftui-app.md`。

---

## 練習

1. 為 `Student` 加 `var email: String`，改 `summary()` 一併印出。
2. 擴充 `Grade` 加 `case d` 同 `switch` 分支。
3. 另做一個 `Teacher` conform `Describable`，傳入 `printSummary`。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| struct 方法改屬性 | 要 `mutating` |
| `switch` 漏掉 case | 必須 exhaustive |
| protocol 屬性不齊全 | 實作齊要求 |

---

## 過關標準

看到 Student、Grade、LoadState、protocol 輸出。  
**基礎完成** → [`../lessons/02-swiftui-app.md`](../lessons/02-swiftui-app.md)（想測驗先做 [`01-basics-refresh.md`](../lessons/01-basics-refresh.md)）。
