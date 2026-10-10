# 08 · Capstone：Mini Todo App

**Playground 類型：** App（多檔）  
**時間：** ~30 分鐘  
**目標：** 綜合 Model、`@Observable`、List、增刪改完成狀態，做出可演示的細 Todo。

---

## 步驟

1. 新建乾淨 **App** playground。
2. 加檔：`TodoItem.swift`、`TodoStore.swift`、`ContentView.swift`、保留 `MyApp.swift`。
3. 逐個貼上程式碼 → ▶。
4. 自測清單（見「過關標準」）。

---

## 完整 code

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

Snippets：`snippets/08-todo-item.swift`、`08-todo-store.swift`、`08-content-view.swift`、`08-my-app.swift`

---

## 練習（加分）

1. 加 `NavigationLink` 去詳情：可改 `title`（詳情頁用 `@Bindable` 或傳 binding）。
2. 加 Filter：分段控制「全部／未完成／已完成」。
3. 用 `JSONEncoder` 把 `items` encode 成字串 `print` 出來（偽「匯出」；Playgrounds 不強制真檔案持久化）。
4. （挑戰）`UserDefaults` 存 JSON——若 API 可用就試；不得就維持 session 內記憶體。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| `toggle` 改不到 | 要用 `firstIndex` 改 `items[i]`，不要改 `ForEach` 裡面的局部 `let item` 複本就算完 |
| 空白都加入 | `trimmingCharacters` + `guard` |
| `@Observable` 不得 | 改 `TodoStore: ObservableObject` + `@Published var items`，View 用 `@StateObject` |
| 刪除掣沒有 | List 要 `ForEach`＋`onDelete`；編輯模式／swipe 視平台 |

---

## 過關標準清單

- [ ] 可以加入新待辦  
- [ ] 可以點撃切換完成  
- [ ] 可以 swipe／onDelete 刪除  
- [ ] 顯示剩餘未完成數量  
- [ ] 「清已完成」正常  

完成＝這套進階教材完成。下一步可自行：持久化、iCloud、或者接到你的 Bootstrap／API。
