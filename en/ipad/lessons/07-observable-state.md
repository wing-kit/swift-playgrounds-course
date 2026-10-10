# 07 · Observable state (`@Observable`) · iPad

**Device:** iPad  
**Playground type:** App Playground  
**Time:** ~25 minutes  
**Goal:** Shared `@Observable` store; multiple views read/write the same state.

> If Playgrounds / iPadOS is too old for `@Observable`, use the **ObservableObject fallback** below.

---

## Steps (iPad)

1. Create a new **App Playground**.
2. Sidebar **＋** → add `CounterStore.swift`; keep/edit `ContentView`, `MyApp`.
3. Paste code → wait for Preview.
4. Tap “＋” with your finger: main view and “child view reads” should update together.
5. Edit the title in the child’s TextField; confirm sync.
6. Small screen: landscape; or hide the sidebar to give Preview room.

---

## Full code (combined, easy one-shot paste)

```swift
import SwiftUI
import Observation

@Observable
final class CounterStore {
    var count = 0
    var title = "共用 Store"

    func increment() { count += 1 }
    func reset() { count = 0 }
}

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

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

To split files: Store uses `import Observation` + `@Observable`; View uses `@State private var store` and `@Bindable` for TextField.

Snippet: `snippets/07-observable-state.swift`

---

## Fallback: ObservableObject (older style)

```swift
import Foundation
import Combine

final class CounterStoreOO: ObservableObject {
    @Published var count = 0
    @Published var title = "共用 Store"
}

// View：@StateObject private var store = CounterStoreOO()
// 子 View：@ObservedObject var store: CounterStoreOO
```

---

## Exercises

1. `history: [Int]`; append on increment; show in a `List`.
2. Third child view: show “even” only when count is even.
3. Anti-pattern: two parents each `CounterStore()` — watch state split.

---

## Common mistakes

| Problem | Fix |
|------|------|
| `@Observable` unknown | Update the app; or use fallback |
| TextField will not bind | `@Bindable var store` |
| Child does not refresh | Pass the same class instance |
| iPad Preview stale | Press ▶ again; save and reopen `.swiftpm` |

---

## Pass criteria

Parent/child stay in sync; you know `@Bindable` → lesson 08 Mini Todo.
