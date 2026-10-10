# 04 · List and NavigationStack · iPad

**Device:** iPad  
**Playground type:** App  
**Time:** ~25 minutes  
**Goal:** `List` + `NavigationStack`; tap a row with your finger to open detail.

---

## Steps (iPad)

1. App Playground; reuse lesson 03 model or paste the combined code below.
2. Wrap content in `NavigationStack`.
3. In Preview, tap a row — it should push detail.
4. Landscape helps see list + detail transitions.

---

## Full code (single-file runnable)

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

Snippet: `snippets/04-list-navigation.swift`

---

## Exercises

1. Add `.searchable(text: $query)` and filter `title`.
2. Detail screen: “Mark favorite” with local `@State private var starred`.
3. Try older `NavigationLink(title) { Detail… }` and compare APIs.

---

## Common mistakes

| Problem | Fix |
|------|------|
| Tap does nothing | Need `NavigationStack` + destination |
| Preview not tappable | Wait for compile; tap inside Preview, not the editor |
| `Course` not Hashable | Add `Hashable` for `navigationDestination(for:)` |

---

## Pass criteria

List → detail round-trip works; finish exercise 1 → lesson 05.
