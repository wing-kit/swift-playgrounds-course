# 02 · SwiftUI App (`@State`, Button, VStack) · iPad

**Device:** iPad  
**Playground type:** **App Playground (`.swiftpm`)**  
**Time:** ~20 minutes  
**Goal:** Open an App Playground with touch; drive Preview with `@State`; use `VStack` / `Button`.

---

## Steps (iPad)

1. File browser → **＋** → **App** / **App Playground** (not Blank).
2. You usually see `MyApp` and `ContentView` in the sidebar. If hidden: tap top-left **sidebar**.
3. Tap the main View file and paste the combined code below (or split by file); **do not** create two `@main`s.
4. Landscape: code on one side, **Preview** on the other. Portrait: toggle preview from the toolbar.
5. Tap + / − in Preview; dismiss the keyboard if it covers the canvas.
6. Do the exercises.

---

## Full code (combined, paste-ready)

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
                Button("−1") { count -= 1 }
                    .buttonStyle(.bordered)

                Button("+1") { count += 1 }
                    .buttonStyle(.borderedProminent)

                Button("重設") { count = 0 }
                    .buttonStyle(.bordered)
            }

            TextField("改名", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
        }
        .padding()
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

Matching snippet: `snippets/02-swiftui-app.swift`

If the template already has `MyApp` + `ContentView`, only update `ContentView`’s `body` and keep the existing `@main`.

---

## Exercises

1. Add a `Toggle` with `@State private var loud = false`; when on, make the title red.
2. Cap `count` at 10.
3. Extract child view `CounterBadge(count: Int)`.

---

## Common mistakes

| Problem | Fix |
|------|------|
| UI does not move | Use `@State` |
| TextField will not edit | Need `$name` Binding |
| Blank has no Preview | Open an **App Playground** |
| Duplicate `@main` | Keep only one |
| Blank Preview | Wait for compile; press ▶; confirm App type |

---

## Pass criteria

Preview buttons and rename work → lesson 03.
