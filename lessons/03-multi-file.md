# 03 · 多檔拆分（View／Model）

**Playground 類型：** App（多檔）  
**時間：** ~20 分鐘  
**目標：** 用側邊欄加 Swift File，將 Model 同 View 分開；理解同一 module 唔使互相 `import`。

---

## 步驟

1. 開（或沿用）**App** playground。
2. 側邊欄 **+** → 新增：
   - `Item.swift`（Model）
   - 確保有 `ContentView.swift`、`MyApp.swift`
3. 分別貼下面三段 code。
4. ▶ 跑，確認列表同摘要出現。

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

1. 喺 `Item` 加 `priority: Int`（預設 0），摘要改成顯示「高優先未完成數」（`priority >= 2 && !done`）。
2. 新建 `ItemRow.swift`（SwiftUI View），把每一行 UI 搬入去，`ContentView` 只呼叫 `ItemRow(item:)`。
3. （可選）加 `extension Item { var label: String { … } }` 顯示「✅ 標題」／「⬜️ 標題」。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| `Cannot find 'Item' in scope` | 確認檔已加喺同一個 playground，檔名／類型名一致 |
| 對自己檔 `import Item` | 唔使；同一 app target／module 直接用 |
| `ForEach` 要 id | `Item` 要 `Identifiable`，或者寫 `ForEach(items, id: \.id)` |
| 兩個 `@main` | 只留一個 App 入口 |

---

## 過關

三個檔分工清楚、畫面有清單同未完成數 → 第 04 課加真正 `List`＋導航。
