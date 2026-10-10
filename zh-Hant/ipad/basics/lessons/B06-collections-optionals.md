# B06 · 字典、集合、Optional（iPad · Blank）

**裝置：** iPad  
**Playground 類型：** Blank  
**時間：** ~25 分鐘  
**目標：** Dictionary／Set；Optional；`if let`／`guard let`／`??`（少用 `!`）。

---

## 步驟（iPad）

1. 開 Blank → 貼上程式碼 → **▶**。
2. 刪走 `minutes` 某個 key（例如註解 `minutes["optionals"] = 25`），再跑睇 Optional 路徑。
3. 完成練習。這課好重要——後面 SwiftUI／網絡成日碰到 `?`。

---

## 完整程式碼（可直接貼上）

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
print(nickname!)

if let nickname {
    print("花名係 \(nickname)")
}

func printNick(_ value: String?) {
    guard let value else {
        print("冇花名")
        return
    }
    print("guard 見到：\(value)")
}

printNick(nil)
printNick("Explorer")

struct User {
    var nick: String?
}
let u = User(nick: "WK")
print(u.nick?.uppercased() ?? "N/A")
```

對應 snippet：`snippets/B06-collections-optionals.swift`

---

## 練習

1. 做 `[String: String]` 電話簿，查不存在的 key，用 `??` 印出「未知」。
2. 用 `Set` 將 `["a","b","a","c"]` 去重後印出 `.count`。
3. 寫 `func firstLetter(_ s: String?) -> String`，`guard let` 失敗就 return `"?"`。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| 字典取值當一定有值 | 回傳是 Optional |
| 濫用 `!` 導致當掉 | 用 `if let`／`??` |
| Set 用 `tags[0]` | Set 無序 |
| 輸入 `?` 不便 | 長按螢幕鍵盤相關鍵；或外接鍵盤 |

---

## 過關標準

看到字典、Set、暱稱 unwrap → B07。
