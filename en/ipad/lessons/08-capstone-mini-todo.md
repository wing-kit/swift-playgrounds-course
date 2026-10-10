# 08 · Capstone: Mini Todo App · iPad

**Device:** iPad  
**Playground type:** App Playground (multi-file)  
**Time:** ~30 minutes  
**Goal:** Model + `@Observable` + List + add/toggle/delete — a demo-ready mini Todo.

---

## Steps (iPad)

1. New clean **App Playground**.
2. Sidebar **＋**: add `TodoItem.swift`, `TodoStore.swift`; edit `ContentView`; keep `MyApp`.
3. Paste each section → ▶ / Preview.
4. Self-check against the pass list (tap, swipe delete as supported).

---

## Full code

### TodoItem.swift

```swift
import Foundation

struct TodoItem: Identifiable, Hashable {
    let id: UUID
    var title: String
    var isDone: Bool
    var createdAt: Date

    init(
        id: UUID = UUID(),
        title: String,
        isDone: Bool = false,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.title = title
        self.isDone = isDone
        self.createdAt = createdAt
    }
}
```

### TodoStore.swift

```swift
import Foundation
import Observation

@Observable
final class TodoStore {
    var items: [TodoItem] = [
        TodoItem(title: "完成第 08 課"),
        TodoItem(title: "示範畀自己睇", isDone: true)
    ]
    var draft = ""

    var remainingCount: Int {
        items.filter { !$0.isDone }.count
    }

    func addFromDraft() {
        let trimmed = draft.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        items.insert(TodoItem(title: trimmed), at: 0)
        draft = ""
    }

    func toggle(_ item: TodoItem) {
        guard let i = items.firstIndex(where: { $0.id == item.id }) else { return }
        items[i].isDone.toggle()
    }

    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func clearDone() {
        items.removeAll { $0.isDone }
    }
}
```

### ContentView.swift

```swift
import SwiftUI

struct ContentView: View {
    @State private var store = TodoStore()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    TextField("新待辦…", text: $store.draft)
                        .textFieldStyle(.roundedBorder)
                        .onSubmit { store.addFromDraft() }
                    Button("加入") { store.addFromDraft() }
                        .buttonStyle(.borderedProminent)
                }
                .padding()

                List {
                    Section("未完成／全部（剩 \(store.remainingCount)）") {
                        ForEach(store.items) { item in
                            Button {
                                store.toggle(item)
                            } label: {
                                HStack {
                                    Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                                        .foregroundStyle(item.isDone ? .green : .secondary)
                                    Text(item.title)
                                        .strikethrough(item.isDone)
                                        .foregroundStyle(item.isDone ? .secondary : .primary)
                                    Spacer()
                                }
                            }
                            .buttonStyle(.plain)
                        }
                        .onDelete(perform: store.delete)
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Mini Todo")
            .toolbar {
                Button("清已完成") { store.clearDone() }
            }
        }
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

Snippets: `snippets/08-todo-item.swift`, `08-todo-store.swift`, `08-content-view.swift`, `08-my-app.swift`

---

## Exercises (bonus)

1. `NavigationLink` to a detail editor (`@Bindable` / binding).
2. Filter: All / Incomplete / Done.
3. Encode `items` with `JSONEncoder` and `print` (fake export).
4. (Challenge) `UserDefaults` if available; else keep session memory.

---

## Common mistakes

| Problem | Fix |
|------|------|
| `toggle` does nothing | Mutate `items[i]` via `firstIndex`, not a local copy |
| Empty titles added | Trim + `guard` |
| `@Observable` missing | Fall back to `ObservableObject` + `@StateObject` |
| No delete | `ForEach` + `onDelete`; swipe / edit mode varies |

---

## Pass checklist

- [ ] Add a todo  
- [ ] Tap to toggle done  
- [ ] Swipe / `onDelete` remove  
- [ ] Show remaining incomplete count  
- [ ] “Clear completed” works  

**iPad track complete.** Back up the `.swiftpm` via Share / Files; you can open it later on a Mac.
