# Swift 基礎速查表（Playgrounds Blank）

## Playgrounds 操作

| 動作 | 怎麼做 |
|------|------|
| 新建 Blank | Swift Playgrounds → **新建 → Blank** |
| 跑 | 按 ▶ |
| 查看結果 | 結果面板的 `print` 輸出 |
| 註解 | `//` 單行；`/* … */` 多行 |

基礎八課全部用 **Blank**。學完再進入進階開 **App**。

---

## 常數／變數／型別

```swift
let name = "Wing Kit"     // 唔改得
var score = 0             // 可以改
score += 10

let pi: Double = 3.14     // 明確標型
let ok = true             // Bool（推斷）
```

常用型別：`Int`、`Double`、`String`、`Bool`。

---

## 字串

```swift
let a = "你好"
let b = "分數：\(score)"
let multi = """
第一行
第二行
"""
```

---

## 控制流

```swift
if score >= 60 {
    print("及格")
} else {
    print("不及格")
}

switch grade {
case "A": print("優")
case "B", "C": print("尚可")
default: print("其他")
}

guard score >= 0 else {
    print("不合理")
    return
}
```

---

## 迴圈同陣列

```swift
for i in 1...5 { print(i) }        // 含 5
for i in 1..<5 { print(i) }       // 唔含 5
for name in ["a", "b"] { print(name) }

var nums = [1, 2, 3]
nums.append(4)
nums.count
nums[0]
```

---

## 字典／集合／Optional

```swift
var ages = ["WK": 30]
ages["WK"]          // Int? ← 注意 Optional

var tags: Set = ["swift", "ios"]
tags.insert("mac")

var nick: String? = nil
print(nick ?? "未設定")
if let nick {
    print(nick)
}
```

少用 `!` 強制解開；優先使用 `if let`／`guard let`／`??`。

---

## 函式同 closure 速記

```swift
func greet(_ name: String, excited: Bool = false) -> String {
    excited ? "你好，\(name)！" : "你好，\(name)"
}

let doubled = [1, 2, 3].map { $0 * 2 }
```

---

## struct／enum／protocol 速記

```swift
struct Student {
    var name: String
    var score: Int
}

enum Grade { case a, b, c }

protocol Describable {
    var summary: String { get }
}
```

---

## 常見錯誤快速對照

| 症狀 | 可能原因 |
|------|----------|
| `is a 'let' constant` | 對 `let` 賦值 → 改 `var` |
| 插值不顯示 | 要用 `"\(x)"`，不是 `"{x}"` |
| Optional 同 String 加不埋 | 先 unwrap／`??` |
| `Value of optional type…` | 字典取值、`first` 等回傳 Optional |
| `guard` 後面繼續跑 | `else` 一定要 `return`／`throw` 離開 |

---

## 課次對應

| 想查詢 | 課 |
|------|-----|
| print／註解 | B01 |
| let／var／型別 | B02 |
| 字串 | B03 |
| if／switch／guard | B04 |
| 迴圈／陣列 | B05 |
| 字典／Optional | B06 |
| 函式／closure | B07 |
| struct／enum | B08 |
| SwiftUI 下一步 | `../lessons/02-swiftui-app.md` |
