# 07 · Observable state (`@Observable`)

**Playground type:** App  
**Time:** ~25 minutes  
**Goal:** Share a store with modern `@Observable`; multiple views read and write the same state.

> If your Swift Playgrounds build is too old for `@Observable`, use the **ObservableObject fallback** at the end of this lesson.

---

## Steps

1. App playground with at least two files: `CounterStore.swift`, `ContentView.swift` (plus `MyApp`).
2. Paste the code and confirm two child views stay in sync on the same `count`.

---

## Full code (modern `@Observable`)

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

Snippet: `snippets/07-observable-state.swift` (combined)

---

## Fallback: ObservableObject (older style)

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

## Exercises

1. Add `var history: [Int] = []`; on each `increment`, `append(count)`; show with `List(store.history, id: \.self)`.
2. Add a third child view that shows “even” only when `count` is even.
3. Experiment: wrongly create a separate `CounterStore()` in two parent views — observe how state splits.

---

## Common mistakes

| Problem | Fix |
|------|------|
| `@Observable` unknown | Update Playgrounds, or use the `ObservableObject` fallback |
| TextField will not bind | Use `@Bindable var store` to get `$store.title` |
| Child view does not refresh | Pass the same class instance; do not `CounterStore()` inside `body` every time |
| Mixing with `@StateObject` | `@Observable` + `@State` ownership; no `@StateObject` needed |

---

## Pass criteria

Shared store updates multiple views; you know the fallback path. Go to lesson 08 Capstone.
