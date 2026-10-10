# 08 · Capstone：Mini Todo App · iPad

**裝置：** iPad  
**Playground 類型：** App Playground（多檔）  
**時間：** ~30 分鐘  
**目標：** 綜合 Model、`@Observable`、List、增刪改；手指可演示的 Todo。

---

## 步驟（iPad）

1. 文件瀏覽器 **＋** → 全新 **App Playground**（建議不要同舊練習混在同一個）。
2. 側邊欄 **＋** 加檔：`TodoItem.swift`、`TodoStore.swift`；改 `ContentView.swift`；保留一個 `MyApp`／`@main`。
3. 逐個檔貼上程式碼 → **▶**。
4. Preview 自測：
   - 打字（螢幕鍵盤）→「加入」
   - 輕觸一列勾選完成
   - **向左滑**一列刪除（`onDelete`）
   - 按工具列「清已完成」
5. 完成後：**分享** → AirDrop／「儲存到檔案」備份成個 `.swiftpm`。
6. （可選）用 **檔案** app 確認位在「Swift Playgrounds」資料夾。

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

Snippets：`08-todo-item.swift`、`08-todo-store.swift`、`08-content-view.swift`、`08-my-app.swift`

---

## 練習（加分）

1. `NavigationLink` 去詳情改 `title`。
2. 分段 Filter：全部／未完成／已完成。
3. `JSONEncoder` 把 items `print` 做偽匯出。
4. （挑戰）`UserDefaults`——若 iPad Playgrounds 可用就試。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| toggle 改不到 | 用 `firstIndex` 改 `items[i]` |
| 空白都加入 | `trimmingCharacters`＋`guard` |
| `@Observable` 不得 | 改用 `ObservableObject` |
| 滑不到刪除 | List＋`ForEach`＋`onDelete`；在 **Preview** 滑，不是編輯文字區 |
| 鍵盤擋掣 | 收起鍵盤；橫向放置；或 `onSubmit` 加入 |

---

## 過關標準清單

- [ ] 可加入新待辦  
- [ ] 可點撃切換完成  
- [ ] 可 swipe 刪除  
- [ ] 顯示剩餘未完成數量  
- [ ] 「清已完成」正常  
- [ ] 已用分享／檔案備份 `.swiftpm`  

完成＝**iPad 軌道**完成。想上架／接 API → 將 `.swiftpm` AirDrop 去 Mac，再用 Xcode／Bootstrap——不在這套範圍。
