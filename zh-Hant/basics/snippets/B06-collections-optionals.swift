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
