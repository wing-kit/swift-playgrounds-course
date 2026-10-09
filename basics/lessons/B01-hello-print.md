# B01 · Hello、`print`、註解（Blank）

**Playground 類型：** Blank  
**時間：** ~15 分鐘  
**目標：** 開第一個 Blank playground；識得用 `print` 睇輸出；識得寫單行／多行註解。

---

## 步驟

1. 開 Swift Playgrounds → **新建 → Blank**。
2. 清走預設範例（如果有），貼下面「完整 code」。
3. 撳 ▶，喺結果面板確認輸出。
4. 做「練習」三條。

---

## 完整 code（可貼）

```swift
import Foundation

// 單行註解：解釋下一行做咩
print("你好，Swift Playgrounds")

/* 多行註解
   可以寫長啲說明
*/
print("Hello, Wing Kit")

// print 可以一次印多個值（用空格隔開）
print("課程", "基礎", "B01")

// 用 
 換行（喺字串入面）
print("第一行
第二行")
```

對應 snippet：`snippets/B01-hello-print.swift`

---

## 練習

1. 再加一行 `print`，印出你今日想學嘅一句話。
2. 用多行註解寫「呢個 playground 係 B01」。
3. 試吓印數字：`print(1 + 2)`，睇結果係咪 `3`。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| 字串唔出 | 要用雙引號 `"…"`，唔係單引號 |
| 改咗 code 但結果舊 | 再撳一次 ▶ |
| 中文亂碼（極少見） | 確認檔案係 UTF-8；Playgrounds 一般 OK |

---

## 過關

結果面板見到問候同「課程 基礎 B01」；練習自測跑得過即可進入 B02。
