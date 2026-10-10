# B01 · Hello、`print`、註解（iPad · Blank）

**裝置：** iPad · Swift Playgrounds  
**Playground 類型：** Blank／純程式輸出  
**時間：** ~15 分鐘  
**目標：** 用手指在文件瀏覽器開啟第一個 playground；識 `print`；識註解。

---

## 步驟（iPad）

1. 打開 **Swift Playgrounds** → 停在 **My Playgrounds** 文件瀏覽器。
2. 右上角 **＋** → 揀 **Blank**（或可跑 Swift、有結果輸出的模板）。
3. 橫向放置 iPad；輕觸編輯區，清除預設範例。
4. 貼上下方「完整 code」（可三指捏合貼上，或外接鍵盤 ⌘V）。
5. 按工具列 **▶**。若結果被螢幕鍵盤擋住，按鍵盤右下角收起，或向下掃結果面板。
6. 做「練習」三條；改完再 ▶。

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
2. 用多行註解寫「這個 playground 是 B01（iPad）」。
3. 試看印數字：`print(1 + 2)`，查看結果是否 `3`。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| 字串不顯示 | 要用雙引號 `"…"` |
| 改了但結果舊 | 再按一次 **▶** |
| 搵不到 ▶ | 確認已打開 playground，不是停在文件列表 |
| 睇不到輸出 | 收起鍵盤；橫向放置；輕觸「結果」相關分頁 |

---

## 過關標準

結果區看到問候同「課程 基礎 B01」→ 進入 B02。
