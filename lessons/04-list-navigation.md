# 04 · List 同 NavigationStack

**Playground 類型：** App  
**時間：** ~25 分鐘  
**目標：** 用 `List` 顯示資料，用 `NavigationStack`＋`NavigationLink` 進入詳情頁。

---

## 步驟

1. App playground；可沿用第 03 課嘅 `Item` model（或一次過貼下面合併版）。
2. 改 `ContentView`，包喺 `NavigationStack`。
3. 撳某一行，應推入詳情。

---

## 完整 code（單檔可跑版；亦可以拆檔）

```swift
import SwiftUI

struct Course: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let minutes: Int
    let blurb: String
}

struct ContentView: View {
    private let courses: [Course] = [
        Course(title: "SwiftUI 基礎", minutes: 20, blurb: "State、Button、佈局"),
        Course(title: "List 導航", minutes: 25, blurb: "NavigationStack 實戰"),
        Course(title: "async/await", minutes: 25, blurb: "非同步同網絡")
    ]

    var body: some View {
        NavigationStack {
            List(courses) { course in
                NavigationLink(value: course) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(course.title)
                            .font(.headline)
                        Text("約 \(course.minutes) 分鐘")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("課程")
            .navigationDestination(for: Course.self) { course in
                CourseDetailView(course: course)
            }
        }
    }
}

struct CourseDetailView: View {
    let course: Course

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(course.title)
                .font(.largeTitle.bold())
            Text(course.blurb)
            Label("\(course.minutes) 分鐘", systemImage: "clock")
            Spacer()
        }
        .padding()
        .navigationTitle("詳情")
        .navigationBarTitleDisplayMode(.inline)
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

Snippet：`snippets/04-list-navigation.swift`

---

## 練習

1. 加 `.searchable(text: $query)`，用 `filter` 過濾 `title`。
2. 詳情頁加 Button「標記為最愛」，用 `@State private var starred` 只喺詳情頁內切換（唔使持久化）。
3. 試 `navigationDestination` 以外嘅寫法：`NavigationLink(course.title) { CourseDetailView(course: course) }`（舊式），比較兩個 API。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| 撳咗冇跳頁 | 要有 `NavigationStack`，同 `navigationDestination`／`NavigationLink` 目的地 |
| `Course` 唔 Hashable | `navigationDestination(for:)` 需要 `Hashable`；加 `Hashable` |
| `id` 每次都變 | `let id = UUID()` 喺 computed 會出事；用存儲屬性或穩定 id（上面寫法 OK） |
| List 入面太複雜手勢 | 先保持一行一個 `NavigationLink` |

---

## 過關

可以列表 → 詳情來回；做完練習 1 再去第 05 課。
