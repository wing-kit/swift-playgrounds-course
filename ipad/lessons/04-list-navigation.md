# 04 · List 同 NavigationStack · iPad

**裝置：** iPad  
**Playground 類型：** App Playground  
**時間：** ~25 分鐘  
**目標：** `List`＋`NavigationStack`；用手指撳某一行進入詳情。

---

## 步驟（iPad）

1. App Playground；可新建乾淨一個，或沿用第 03 課。
2. 用下面單檔可跑版貼入主 View（或拆檔）。
3. **▶**，喺 Preview **用手指輕觸**某一行 → 應推入詳情。
4. 詳情頁左上角 **＜** 返回（系統導航）。
5. iPad 橫放時 List 較易睇；可選 Stage Manager 放大 Preview。

---

## 完整 code（單檔可跑版）

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

1. 加 `.searchable(text: $query)` 過濾 `title`。
2. 詳情頁加「標記為最愛」`@State`。
3. 比較舊式 `NavigationLink(title) { Detail }` 同 `navigationDestination`。

---

## 常見錯誤

| 問題 | 解法 |
|------|------|
| 撳咗冇跳頁 | 要有 `NavigationStack`＋destination |
| 唔 Hashable | `Course` 加 `Hashable` |
| Preview 撳唔到 | 等編譯完；確認手指撳喺 Preview 唔係編輯區 |
| 返回掣冇 | 詳情要喺 NavigationStack 內 |

---

## 過關

列表 → 詳情來回 OK；練習 1 → 第 05 課。
