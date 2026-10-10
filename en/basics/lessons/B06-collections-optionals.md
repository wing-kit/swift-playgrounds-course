# B06 · Dictionaries, sets, Optional (Blank)

**Playground type:** Blank  
**Time:** ~25 minutes  
**Goal:** Use Dictionary / Set; understand Optional (`?`); unwrap safely with `if let` / `guard let` / `??` (avoid `!`).

---

## Steps

1. Blank, paste code, press ▶.
2. Remove a key and watch the Optional path change.
3. Do the exercises.

---

## Full code (paste-ready)

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

Matching snippet: `snippets/B06-collections-optionals.swift`

---

## Exercises

1. Make a `[String: String]` phone book; look up a missing key and print "unknown" with `??`.
2. Use `Set` to dedupe `["a","b","a","c"]` and print `.count`.
3. Write `func firstLetter(_ s: String?) -> String` that `guard let`s and returns `"?"` on failure.

---

## Common mistakes

| Problem | Fix |
|------|------|
| Treating dictionary lookup as always present | It returns `Value?` — unwrap |
| Overusing `!` and crashing | Prefer `if let` / `guard let` / `??` |
| Indexing a Set with `tags[0]` | Sets are unordered — use `contains` / `for-in` |

---

## Pass criteria

You see the dictionary listing, Set, and nickname unwrap. Go to B07.
