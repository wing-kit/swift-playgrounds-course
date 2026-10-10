# B01 · Hello、`print`、註解（Blank）

**Playground 類型：** Blank  
**時間：** ~15 分鐘  
**目標：** 開啟第一個 Blank playground；懂得使用 `print` 查看輸出；能夠撰寫單行／多行註解。

---

## 步驟

1. 開 Swift Playgrounds → **新建 → Blank**。
2. 清除預設範例（如果有），貼上下方「完整 code」。
3. 按 ▶，在結果面板確認輸出。
4. 做「練習」三條。

---

## 完整程式碼（可直接貼上）

```swift
import Foundation

// 單行註解：解釋下一行做什麼
print("你好，Swift Playgrounds")

/* 多行註解
   可以寫長一點說明
*/
print("Hello, Wing Kit")

// print 可以一次印多個值（用空格隔開）
print("課程", "基礎", "B01")

// 用 \n 換行（在字串裡面）
print("第一行\n第二行")
```

對應 snippet：`snippets/B01-hello-print.swift`

---

## 練習

1. 再加一行 `print`，印出你今日想學的一句話。
2. 用多行註解寫「這個 playground 是 B01」。
3. 試看印數字：`print(1 + 2)`，查看結果是否 `3`。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| 字串不顯示 | 要用雙引號 `"…"`，不是單引號 |
| 改了程式碼 但結果舊 | 再按一次 ▶ |
| 中文亂碼（極少見） | 確認檔案是 UTF-8；Playgrounds 一般沒問題 |

---

## 過關標準

結果面板看到問候同「課程 基礎 B01」；練習自測能成功執行即可進入 B02。
