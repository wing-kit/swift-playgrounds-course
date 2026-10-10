# B06 · Dictionaries, sets, Optional (iPad · Blank)

**Device:** iPad · Swift Playgrounds  
**Playground type:** Blank / plain program output  
**Time:** ~25 minutes  
**Goal:** Use Dictionary / Set; understand Optional; unwrap safely with `if let` / `guard let` / `??`.

---

## Steps (iPad)

1. File browser → **＋** → **Blank** (or reuse the previous Blank).
2. Paste the code below → press **▶**.
3. Follow any lesson-specific tip below.
4. Do the exercises; dismiss the keyboard if it covers results.

**Tip:** Delete a key and watch the Optional path change.

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
