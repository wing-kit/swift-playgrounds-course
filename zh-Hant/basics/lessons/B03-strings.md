# B03 · 字串同插值、多行字串（Blank）

**Playground 類型：** Blank  
**時間：** ~15 分鐘  
**目標：** 熟練字串拼接與插值；會寫多行字串。

---

## 步驟

1. Blank playground，貼上程式碼，▶ 跑。
2. 改插值裡面的變數，再跑一次查看輸出如何變化。
3. 完成練習。

---

## 完整程式碼（可直接貼上）

```swift
import Foundation

let name = "Wing Kit"
let lesson = 3

// MARK: - 插值（最常用）
let line = "你好，\(name)！現在是 B0\(lesson)。"
print(line)

// MARK: - 用 + 拼接（型別要一致）
let a = "Swift"
let b = "Playgrounds"
print(a + " " + b)

// MARK: - 常用字串操作
let raw = "  hello SWIFT  "
print(raw.trimmingCharacters(in: .whitespaces).lowercased())
print("長度：\(raw.count)")  // 注意：含空格
print(a.hasPrefix("Sw"))
print(b.contains("ground"))

// MARK: - 多行字串
let memo = """
今日重點：
1. 插值
2. 多行字串
3. 小練習
"""
print(memo)

// 多行入面都一樣用插值
let report = """
學員：\(name)
進度：B0\(lesson)
"""
print(report)
```

對應 snippet：`snippets/B03-strings.swift`

---

## 練習

1. 用插值印出「分數：95／100」。
2. 寫一段三行的多行字串自我介紹。
3. 檢查 `"playground".uppercased()` 是否 `"PLAYGROUND"`。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| 插值不顯示、原樣顯示 | 要用 `"\(x)"`，不是 `"{x}"` 或 `"$x"` |
| `+` 拼接 Int | 先轉成字串：`"第 \(n) 課"` 或 `String(n)` |
| 多行字串縮排怪異 | 結尾 `"""` 的縮排會決定每行被削多少空白 |

---

## 過關標準

看到問候、拼接、多行 memo；進入 B04。
