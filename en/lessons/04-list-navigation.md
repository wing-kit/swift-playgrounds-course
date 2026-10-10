# 04 · List and NavigationStack

**Playground type:** App  
**Time:** ~25 minutes  
**Goal:** Show data in a `List`; push a detail screen with `NavigationStack` + `NavigationLink`.

---

## Steps

1. App playground; you may reuse the `Item` model from lesson 03 (or paste the combined version below).
2. Update `ContentView` and wrap it in `NavigationStack`.
3. Tap a row — it should push the detail screen.

---

## Full code (single-file runnable; you can still split files)

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

1. Add `.searchable(text: $query)` and `filter` on `title`.
2. On the detail screen, add a “Mark favorite” Button with `@State private var starred` (local only; no persistence).
3. Try the older API: `NavigationLink(course.title) { CourseDetailView(course: course) }` and compare with `navigationDestination`.

---

## Common mistakes

| Problem | Fix |
|------|------|
| Tap does nothing | Need `NavigationStack` plus a `navigationDestination` / `NavigationLink` destination |
| `Course` is not Hashable | `navigationDestination(for:)` needs `Hashable` — add it |
| `id` changes every time | `let id = UUID()` in a computed property breaks identity; use stored or stable ids |
| Over-complex gestures inside List | Keep one `NavigationLink` per row first |

---

## Pass criteria

You can go list → detail and back; finish exercise 1, then go to lesson 05.
