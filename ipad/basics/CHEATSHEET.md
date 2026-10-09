# Swift 基礎速查表（iPad · Blank）

## iPad Playgrounds 操作

| 動作 | 點做 |
|------|------|
| 新建 Blank | Swift Playgrounds → **＋** → Blank／程式模板 |
| 跑 | 工具列 **▶** |
| 睇結果 | 結果面板 `print`（必要時收起螢幕鍵盤） |
| 返列表 | 左上角返回文件瀏覽器 |
| 註解 | `//`；`/* … */` |

基礎八課全部用 **Blank／純輸出**。學完先開 **App Playground** 做進階。

更完整手勢：[`../CHEATSHEET.md`](../CHEATSHEET.md)

---

## 常數／變數／型別

```swift
let name = "Wing Kit"
var score = 0
score += 10
let pi: Double = 3.14
```

常用：`Int`、`Double`、`String`、`Bool`。

---

## 字串

```swift
let b = "分數：\(score)"
let multi = """
第一行
第二行
"""
```

---

## 控制流

```swift
if score >= 60 { print("及格") } else { print("不及格") }

switch grade {
case "A": print("優")
default: print("其他")
}

guard score >= 0 else { return }
```

---

## 迴圈同陣列

```swift
for i in 1...5 { print(i) }
var nums = [1, 2, 3]
nums.append(4)
```

---

## 字典／Optional

```swift
var ages = ["WK": 30]
ages["WK"]          // Int?
print(ages["WK"] ?? -1)
if let n = ages["WK"] { print(n) }
```

少用 `!`。

---

## 函式／closure／struct

```swift
func greet(_ name: String) -> String { "你好，\(name)" }
let doubled = [1, 2, 3].map { $0 * 2 }

struct Student { var name: String; var score: Int }
enum Grade { case a, b, c }
```

---

## 常見錯誤

| 症狀 | 原因 |
|------|------|
| `let` constant | 改用 `var` |
| 插值唔出 | 要用 `"\(x)"` |
| Optional 加唔埋 | 先 unwrap |
| 螢幕睇唔到輸出 | 收鍵盤／橫放／撳結果分頁 |
| 停喺文件瀏覽器 | 要打開某個 playground 先有 ▶ |

## 課次

B01 print · B02 let/var · B03 字串 · B04 分支 · B05 迴圈 · B06 Optional · B07 func · B08 struct → [`../lessons/02-swiftui-app.md`](../lessons/02-swiftui-app.md)
