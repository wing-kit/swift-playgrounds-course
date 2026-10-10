# 08 · Capstone: Mini Todo App

**Playground type:** App (multi-file)  
**Time:** ~30 minutes  
**Goal:** Combine Model, `@Observable`, List, and add/toggle/delete into a demo-ready mini Todo.

---

## Steps

1. Create a clean **App** playground.
2. Add files: `TodoItem.swift`, `TodoStore.swift`, `ContentView.swift`, keep `MyApp.swift`.
3. Paste each section → press ▶.
4. Self-check against the pass list below.

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

1. Add a `NavigationLink` to a detail screen that can edit `title` (use `@Bindable` or a binding).
2. Add a filter segmented control: All / Incomplete / Done.
3. `JSONEncoder`-encode `items` and `print` the string (fake “export”; Playgrounds need not persist to disk).
4. (Challenge) Persist JSON with `UserDefaults` if the API is available; otherwise keep in-memory for the session.

---

## Common mistakes

| Problem | Fix |
|------|------|
| `toggle` does nothing | Use `firstIndex` and mutate `items[i]` — do not only mutate a local `let item` copy from `ForEach` |
| Empty titles get added | `trimmingCharacters` + `guard` |
| `@Observable` unavailable | Switch `TodoStore` to `ObservableObject` + `@Published var items`, View uses `@StateObject` |
| No delete control | List needs `ForEach` + `onDelete`; edit mode / swipe varies by platform |

---

## Pass checklist

- [ ] Can add a new todo  
- [ ] Can tap to toggle done  
- [ ] Can swipe / `onDelete` to remove  
- [ ] Shows remaining incomplete count  
- [ ] “Clear completed” works  

**Course complete.** Next ideas (outside this repo): move to Xcode, call a real API, or wire a backend.
