# B04 · 運算子、`if`／`else`、`switch`、`guard` 入門（iPad · Blank）

**裝置：** iPad  
**Playground 類型：** Blank  
**時間：** ~20 分鐘  
**目標：** 寫分支；識 `switch`；初步認識 `guard`。

---

## 步驟（iPad）

1. **＋** 開 Blank（或複製 B03 改名）→ 貼上程式碼 → **▶**。
2. 用手指改 `score` 幾個值（例如 55、75、95），每次 ▶ 查看分支如何切換。
3. 完成練習。長 code 可用側邊欄之外的全螢幕編輯；直向放置時記得滾動睇晒輸出。

---

## 完整程式碼（可直接貼上）

```swift
import Foundation

let score = 86
let hasMakeup = false

// MARK: - 比較同邏輯
print(score >= 60)
print(score >= 80 && score < 90)
print(hasMakeup || score >= 60)

// MARK: - if / else if / else
if score >= 90 {
    print("甲")
} else if score >= 80 {
    print("乙")
} else if score >= 60 {
    print("丙")
} else {
    print("不及格")
}

let passLabel = score >= 60 ? "及格" : "不及格"
print(passLabel)

// MARK: - switch
let gradeLetter = "B"
switch gradeLetter {
case "A":
    print("優秀")
case "B", "C":
    print("良好／尚可")
case "D":
    print("及格邊緣")
default:
    print("未知等級")
}

switch score {
case 90...100:
    print("區間：優")
case 60..<90:
    print("區間：中")
default:
    print("區間：低")
}

// MARK: - guard 入門
func checkScore(_ value: Int) {
    guard value >= 0, value <= 100 else {
        print("分數不合理：\(value)")
        return
    }
    print("接受分數：\(value)")
}

checkScore(86)
checkScore(-3)
```

對應 snippet：`snippets/B04-control-flow.swift`

---

## 練習

1. 用 `if` 判斷年齡 `age` 是否 ≥ 18，印出「成年」／「未成年」。
2. `switch` 一個 `Int` 代表星期的數字（1…7）印出星期一至日。
3. 寫 `func sayHi(_ name: String)`，用 `guard !name.isEmpty else { return }` 擋下空字串。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| `=` 當成比較 | 比較是 `==` |
| `switch` 不 exhaustive | 加 `default` |
| `guard` 沒有 `return` | `else` 必須離開作用域 |
| 改了分數以為自動跑 | iPad 要再按 **▶** |

---

## 過關標準

看到等級、區間、`guard` 拒絕負分 → B05。
