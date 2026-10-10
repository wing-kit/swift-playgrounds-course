# B03 · 字串同插值、多行字串（iPad · Blank）

**裝置：** iPad  
**Playground 類型：** Blank  
**時間：** ~15 分鐘  
**目標：** 熟練插值同多行字串。

---

## 步驟（iPad）

1. 新建或複製 Blank → 貼上程式碼 → 按 **▶**。
2. 改 `name`／`lesson` 再 ▶，確認結果區接著變。
3. 打字串插值時，螢幕鍵盤可能要切換到符號頁先找到 `\`；有外接鍵盤會快一些。
4. 完成練習。

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
print("長度：\(raw.count)")
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
2. 寫一段三行多行字串自我介紹。
3. 檢查 `"playground".uppercased()` 是否 `"PLAYGROUND"`。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| 插值原樣顯示 | 要用字串插值語法（反斜線加括號包住變數），不是 `{x}` 或 `$x` |
| `+` 拼接 Int | 用插值或 `String(n)` |
| 多行字串縮排怪異 | 留意結尾三個引號的縮排 |
| 鍵盤擋住結果 | 收起螢幕鍵盤；橫向放置 iPad |

---

## 過關標準

看到問候、拼接、memo → B04。
