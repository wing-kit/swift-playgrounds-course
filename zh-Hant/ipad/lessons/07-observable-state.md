# 07 · Observable 狀態（@Observable）· iPad

**裝置：** iPad  
**Playground 類型：** App Playground  
**時間：** ~25 分鐘  
**目標：** `@Observable` 共用 store；多個 View 讀寫同一狀態。

> 若 Playgrounds／iPadOS 版本過舊不識 `@Observable`，用課末 **ObservableObject 後備**。

---

## 步驟（iPad）

1. 新建 **App Playground**。
2. 側邊欄 **＋** → 加 `CounterStore.swift`；保留／改 `ContentView`、`MyApp`。
3. 貼上程式碼 → 等 Preview。
4. 用手指點選「＋」：主畫面與「子 View 讀到」應一齊變。
5. 在子 View 的 TextField 改標題，確認同步。
6. 螢幕細：橫向放置；或暫時隱藏側邊欄騰位畀 Preview。

---

## 完整 code（合併版方便一次貼）

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

若要拆檔：Store 用 `import Observation`＋`@Observable`；View 用 `@State private var store`、`@Bindable` 綁 TextField。

Snippet：`snippets/07-observable-state.swift`

---

## 後備：ObservableObject（舊風格）

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

## 練習

1. `history: [Int]`，每次 increment append；`List` 顯示。
2. 第三個子 View：只在偶數顯示「偶數」。
3. 錯誤示範：兩個父 View 各自 `CounterStore()`——觀察狀態分裂。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| `@Observable` unknown | 更新 app；或用後備 |
| TextField 綁不到 | `@Bindable var store` |
| 子 View 不刷新 | 傳同一個 class 實例 |
| iPad Preview 不更新 | 再 ▶；儲存後重開 `.swiftpm` |

---

## 過關標準

父子同步、識 `@Bindable` → 第 08 課 Mini Todo。
