# 03 · Multi-file split (View / Model) · iPad

**Device:** iPad  
**Playground type:** App Playground (multi-file)  
**Time:** ~20 minutes  
**Goal:** Add Swift files from the sidebar; split Model and View; same module needs no mutual `import`.

---

## Steps (iPad)

1. Open (or reuse) an **App Playground**.
2. Sidebar **＋** → add `Item.swift`; keep `ContentView.swift` and `MyApp.swift`.
3. Paste the three sections below into the matching files.
4. Press ▶ / wait for Preview; confirm list and summary.

---

## Full code

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

Snippets: `snippets/03-model.swift`, `03-content-view.swift`, `03-my-app.swift`

---

## Exercises

1. Add `priority: Int` (default 0); summary shows high-priority incomplete count.
2. Create `ItemRow.swift` and move row UI there.
3. (Optional) `extension Item { var label: String { … } }`.

---

## Common mistakes

| Problem | Fix |
|------|------|
| `Cannot find 'Item' in scope` | File must be in the same `.swiftpm`; names match |
| `import` your own file | Not needed in the same module |
| Two `@main` | Keep one |
| Cannot add file | Use sidebar ＋ inside App Playground |

---

## Pass criteria

Three clear files; list + incomplete count → lesson 04.
