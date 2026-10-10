# 07 · Observable 狀態（@Observable）

**Playground 類型：** App  
**時間：** ~25 分鐘  
**目標：** 用現代 `@Observable` 做共用 store；多個 View 讀寫同一份狀態。

> 若你的 Swift Playgrounds 版本版本過舊、`@Observable` 不識，課末有 **ObservableObject 後備版**。

---

## 步驟

1. App playground，建議至少兩個檔：`CounterStore.swift`、`ContentView.swift`（加 `MyApp`）。
2. 貼上程式碼，確認兩個子 View 同步更新同一個 `count`。

---

## 完整 code（現代 @Observable）

### CounterStore.swift

```swift
import Foundation
import Observation

@Observable
final class CounterStore {
    var count = 0
    var title = "共用 Store"

    func increment() { count += 1 }
    func reset() { count = 0 }
}
```

### ContentView.swift

```swift
import SwiftUI

struct ContentView: View {
    @State private var store = CounterStore()

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text(store.title)
                    .font(.largeTitle.bold())

                Text("\(store.count)")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .monospacedDigit()

                HStack {
                    Button("＋") { store.increment() }
                        .buttonStyle(.borderedProminent)
                    Button("重設") { store.reset() }
                        .buttonStyle(.bordered)
                }

                Divider()

                // 子 View 收同一個 store 參考
                ChildReadView(store: store)
                ChildEditTitleView(store: store)
            }
            .padding()
            .navigationTitle("Observable")
        }
    }
}

struct ChildReadView: View {
    var store: CounterStore

    var body: some View {
        Text("子 View 讀到：\(store.count)")
            .foregroundStyle(.secondary)
    }
}

struct ChildEditTitleView: View {
    @Bindable var store: CounterStore

    var body: some View {
        TextField("改標題", text: $store.title)
            .textFieldStyle(.roundedBorder)
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

Snippet：`snippets/07-observable-state.swift`（合併版）

---

## 後備：ObservableObject（舊風格）

```swift
import Foundation
import Combine

final class CounterStoreOO: ObservableObject {
    @Published var count = 0
    @Published var title = "共用 Store"
}

// View：
// @StateObject private var store = CounterStoreOO()
// 子 View：@ObservedObject var store: CounterStoreOO
```

---

## 練習

1. 加 `var history: [Int] = []`，每次 `increment` 都 `append(count)`；用 `List(store.history, id: \.self)` 顯示。
2. 新建第三個子 View，只在 `count` 是偶數時顯示「偶數」。
3. 比較：把 `@State private var store` 改錯成在兩個父 View 各自 `CounterStore()`——觀察點解狀態會分裂。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| `@Observable` unknown | 更新 Playgrounds；或用後備 `ObservableObject` |
| TextField 綁不到 | 用 `@Bindable var store` 先有 `$store.title` |
| 子 View 不刷新 | 確認傳入同一個 class 實例，不要每次 body 都 `CounterStore()` |
| 同 `@StateObject` 搞亂 | `@Observable`＋`@State` 持有；不必 `@StateObject` |

---

## 過關標準

父子 View 同步；會用 `@Bindable` → 第 08 課做 Mini Todo。
