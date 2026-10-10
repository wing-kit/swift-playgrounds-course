# 03 · Multi-file split (View / Model)

**Playground type:** App (multi-file)  
**Time:** ~20 minutes  
**Goal:** Add Swift files from the sidebar; split Model and View; understand that the same module does not need mutual `import`.

---

## Steps

1. Open (or reuse) an **App** playground.
2. Sidebar **+** → add:
   - `Item.swift` (Model)
   - Ensure you have `ContentView.swift` and `MyApp.swift`
3. Paste the three code sections below into the matching files.
4. Press ▶ and confirm the list and summary appear.

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

1. Add `priority: Int` (default 0) to `Item`; update the summary to show a “high-priority incomplete” count (`priority >= 2 && !done`).
2. Create `ItemRow.swift` (SwiftUI View), move each row’s UI there, and have `ContentView` call `ItemRow(item:)`.
3. (Optional) Add `extension Item { var label: String { … } }` showing “✅ title” / “⬜️ title”.

---

## Common mistakes

| Problem | Fix |
|------|------|
| `Cannot find 'Item' in scope` | Confirm the file is in the same playground; names match |
| `import Item` for your own file | Not needed — same app target/module uses types directly |
| `ForEach` needs id | Make `Item` `Identifiable`, or write `ForEach(items, id: \.id)` |
| Two `@main` | Keep only one App entry |

---

## Pass criteria

Three files with clear roles; UI shows the list and incomplete count → lesson 04 adds a real `List` + navigation.
