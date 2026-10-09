# 03 · 多檔拆分（View／Model）· iPad

**裝置：** iPad  
**Playground 類型：** App Playground（多檔）  
**時間：** ~20 分鐘  
**目標：** 用側邊欄 **＋** 加 Swift 檔；Model／View 分開；同一 module 唔使互相 `import`。

---

## 步驟（iPad）

1. 開（或新建）**App Playground**。
2. 打開 **側邊欄**（左上圖示）。
3. 側邊欄下方或上方 **＋** → **Swift File**，命名 `Item.swift`（Model）。
4. 確認有 `ContentView.swift`、`MyApp.swift`（名稱視模板；入口要有一個 `@main`）。
5. 逐個輕觸檔案，貼對應 code。
6. **▶**／等 Preview：應見到清單同「未完成」數。
7. （可選）長按側邊欄檔名可重新命名／刪除。

---

## 完整 code

### Item.swift

```swift
import Foundation

struct Item: Identifiable, Hashable {
    let id: UUID
    var title: String
    var done: Bool

    init(id: UUID = UUID(), title: String, done: Bool = false) {
        self.id = id
        self.title = title
        self.done = done
    }
}

enum SampleData {
    static let items: [Item] = [
        Item(title: "讀第 03 課"),
        Item(title: "拆 Model／View", done: true),
        Item(title: "做練習")
    ]
}
```

### ContentView.swift

```swift
import SwiftUI

struct ContentView: View {
    private let items = SampleData.items

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("多檔示範")
                .font(.largeTitle.bold())

            Text("未完成：\(items.filter { !$0.done }.count)")
                .foregroundStyle(.secondary)

            ForEach(items) { item in
                HStack {
                    Image(systemName: item.done ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(item.done ? .green : .secondary)
                    Text(item.title)
                }
            }

            Spacer()
        }
        .padding()
    }
}
```

### MyApp.swift

```swift
import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

Snippets：`snippets/03-model.swift`、`03-content-view.swift`、`03-my-app.swift`

---

## 練習

1. `Item` 加 `priority: Int`（預設 0）；顯示高優先未完成數。
2. 側邊欄 **＋** 再加 `ItemRow.swift`，把每一行 UI 搬入去。
3. （可選）`extension Item` 加 `label`。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| `Cannot find 'Item'` | 確認檔已加喺同一個 App Playground |
| 對自己檔 `import Item` | 唔使 |
| 兩個 `@main` | 只留一個 |
| 側邊欄＋搵唔到 | 確認開咗 App Playground，唔係 Blank |

---

## 過關

三個檔分工清楚、Preview 有清單 → 第 04 課。
