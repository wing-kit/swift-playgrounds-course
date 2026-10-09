# B06 · 字典、集合、Optional（Blank）

**Playground 類型：** Blank  
**時間：** ~25 分鐘  
**目標：** 用 Dictionary／Set；理解 Optional（`?`）；用 `if let`／`guard let`／`??` 安全解開（少用 `!`）。

---

## 步驟

1. Blank，貼 code，▶ 跑。
2. 將某個 key 刪走，睇 Optional 路徑點變。
3. 做練習。

---

## 完整 code（可貼）

```swift
import Foundation

// MARK: - Dictionary
var minutes: [String: Int] = [
    "print": 15,
    "types": 20,
    "strings": 15
]
minutes["optionals"] = 25
print("types 課約 \(minutes["types"] ?? -1) 分")

if let m = minutes["loops"] {
    print("有 loops：\(m)")
} else {
    print("未有 loops 呢課（示範 Optional 係 nil）")
}

for (topic, mins) in minutes {
    print("- \(topic)：\(mins) 分")
}

// MARK: - Set（唔重複、無序）
var tags: Set<String> = ["swift", "mac", "swift"]
tags.insert("ios")
print("tags：\(tags)")
print("有 mac？\(tags.contains("mac"))")

// MARK: - Optional 基礎
var nickname: String? = nil
print(nickname ?? "未設定花名")

nickname = "WK"
print(nickname!)  // 強制解開：只喺你 100% 肯定唔係 nil 先用

// if let（推薦）
if let nickname {
    print("花名係 \(nickname)")
}

// guard let（函式入面）
func printNick(_ value: String?) {
    guard let value else {
        print("冇花名")
        return
    }
    print("guard 見到：\(value)")
}

printNick(nil)
printNick("Explorer")

// 可選鏈（預告）
struct User {
    var nick: String?
}
let u = User(nick: "WK")
print(u.nick?.uppercased() ?? "N/A")
```

對應 snippet：`snippets/B06-collections-optionals.swift`

---

## 練習

1. 做一個 `[String: String]` 電話簿，查一個唔存在嘅 key，用 `??` 印「未知」。
2. 用 `Set` 將 `["a","b","a","c"]` 去重後印 `.count`。
3. 寫 `func firstLetter(_ s: String?) -> String`，`guard let` 失敗就 return `"?"`。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| 字典取值當咗一定有值 | 回傳係 `Value?`，要 unwrap |
| 濫甩 `!` crash | 優先 `if let`／`guard let`／`??` |
| Set 用下標 `tags[0]` | Set 無序，用 `contains`／`for-in` |

---

## 過關

見到字典列表、Set、花名 unwrap；進入 B07。
