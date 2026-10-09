# B03 · 字串同插值、多行字串（Blank）

**Playground 類型：** Blank  
**時間：** ~15 分鐘  
**目標：** 熟練字串拼接同插值；會寫多行字串。

---

## 步驟

1. Blank playground，貼 code，▶ 跑。
2. 改插值入面嘅變數，再跑一次睇輸出點變。
3. 做練習。

---

## 完整 code（可貼）

```swift
import Foundation

let name = "Wing Kit"
let lesson = 3

// MARK: - 插值（最常用）
let line = "你好，\(name)！而家係 B0\(lesson)。"
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
2. 寫一段三行嘅多行字串自我介紹。
3. 檢查 `"playground".uppercased()` 係咪 `"PLAYGROUND"`。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| 插值唔出、原樣顯示 | 要用 `"\(x)"`，唔係 `"{x}"` 或 `"$x"` |
| `+` 拼 Int | 先轉字串：`"第 \(n) 課"` 或 `String(n)` |
| 多行字串縮排怪 | 結尾 `"""` 嘅縮排會決定每行被削幾多空白 |

---

## 過關

見到問候、拼接、多行 memo；進入 B04。
