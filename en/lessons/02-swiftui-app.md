# 02 · SwiftUI App (`@State`, Button, VStack)

**Playground type:** App  
**Time:** ~20 minutes  
**Goal:** Create an App playground; drive the UI with `@State`; use `VStack` / `Button` / simple styling.

---

## Steps

1. **New → App** (not Blank).
2. You usually get `MyApp` (entry) and `ContentView`. Paste the code into the matching files (or keep everything in `ContentView`, depending on the template).
3. The preview on the right should update live; change numbers and tap buttons to confirm.

> If the template is a single file, keep the `@main` structure intact.

---

## Full code (paste-ready)

**ContentView.swift** (or main View file)

```swift
import SwiftUI

struct ContentView: View {
    @State private var count = 0
    @State private var name = "Wing Kit"

    var body: some View {
        VStack(spacing: 16) {
            Text("SwiftUI 計數器")
                .font(.largeTitle.bold())

            Text("你好，\(name)")
                .font(.title2)

            Text("次數：\(count)")
                .font(.title)
                .monospacedDigit()
                .foregroundStyle(count >= 5 ? .green : .primary)

            HStack(spacing: 12) {
                Button("−1") {
                    count -= 1
                }
                .buttonStyle(.bordered)

                Button("+1") {
                    count += 1
                }
                .buttonStyle(.borderedProminent)

                Button("重設") {
                    count = 0
                }
                .buttonStyle(.bordered)
            }

            TextField("改名", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
        }
        .padding()
    }
}
```

**MyApp.swift** (if the template splits the entry point)

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

Matching snippet: `snippets/02-swiftui-app.swift` (combined, easy to paste once).

---

## Exercises

1. Add a `Toggle` with `@State private var loud = false`; when `loud == true`, make the title red.
2. Cap `count` at 10 (use `guard` or `min` inside the Button).
3. Extract a child view `CounterBadge(count: Int)` and pass `count` from the parent (value for now; Bindings deepen in lesson 07).

---

## Common mistakes

| Problem | Fix |
|------|------|
| Variable changes but UI does not | Use `@State`, not a plain `var` |
| `TextField` will not edit | Need `$name` (Binding), not `name` |
| SwiftUI in Blank with no preview | Switch to an **App** playground |
| Duplicate `@main` | Only one `@main` per project |

---

## Pass criteria

+ / − / reset and rename all work; finish at least exercise 1, then go to lesson 03.
