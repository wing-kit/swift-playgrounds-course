# Swift Playgrounds cheat sheet (Mac)

## Common App UI actions

| Action | How |
|------|------|
| New | Open Swift Playgrounds → **New Playground** → pick **Blank** or **App** |
| Run | Press ▶ (or run selection, depending on version) |
| See results | Blank: results pane `print`; App: live preview on the right |
| Add file | Sidebar **+** → Swift File / SwiftUI View |
| App entry | App type usually has `MyApp` (`@main`) and `ContentView` |
| Add Package | **File → Add Package…** (optional; not required here) |
| Share | Share the playground file / folder |

**Blank vs App**

- **Blank:** pure Swift — logic, `print`, Codable, async experiments.
- **App:** SwiftUI with preview — UI, navigation, state.

Within the same module you **do not** `import` your own files (system frameworks still need `import SwiftUI`, etc.).

---

## Swift basics

```swift
let x = 1          // constant
var y = 2          // variable
y += 1
print("value: \(y)")  // string interpolation
```

Optionals:

```swift
var name: String? = nil
if let name {
    print(name)
}
print(name ?? "unnamed")
```

---

## Common SwiftUI views

```swift
VStack { }          // vertical
HStack { }          // horizontal
ZStack { }          // layered
List { }            // list
NavigationStack { } // navigation stack
Text("Hello")
Button("Tap") { }
TextField("Hint", text: $binding)
Toggle("On", isOn: $on)
```

Modifiers (apply from nearest to farthest on the View):

```swift
.padding()
.font(.headline)
.foregroundStyle(.blue)
.navigationTitle("Title")
```

---

## State

**Short-lived state inside a View**

```swift
@State private var count = 0
// Pass to child with $count → Binding
```

**Shared across views (modern)**

```swift
@Observable
final class Store {
    var items: [String] = []
}

@State private var store = Store()
// Child view: read store.items; SwiftUI tracks it
```

Older but still common: `ObservableObject` + `@Published` + `@StateObject` / `@ObservedObject`.

---

## Lists and navigation

```swift
NavigationStack {
    List(items) { item in
        NavigationLink(item.title) {
            DetailView(item: item)
        }
    }
    .navigationTitle("List")
}
```

Data should be `Identifiable` (stable `id`), or use `List(items, id: \.self)`.

---

## async / await

```swift
Task {
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        // Ensure main actor before UI updates (SwiftUI often handles this; use MainActor if needed)
    } catch {
        print(error)
    }
}
```

```swift
@MainActor
func load() async { ... }
```

---

## Codable

```swift
struct User: Codable {
    let id: Int
    let name: String
}

let user = try JSONDecoder().decode(User.self, from: data)
let data = try JSONEncoder().encode(user)
```

Use `CodingKeys` when field names differ.

---

## Common mistakes (quick lookup)

| Symptom | Likely cause |
|------|----------|
| Changed `@State` but UI frozen | Mutated a struct copy, or did not update via `$` / store |
| Empty List / crash | Missing `Identifiable` / `id` |
| `Cannot find X in scope` | File not in project, or typo |
| `print` invisible in App | Check preview / debug output, or try Blank temporarily |
| Network fail | Playgrounds network limits → use mock `Data` |
| `@Observable` error | Playgrounds / SDK too old → fall back to `ObservableObject` |

---

## Lesson map

| Looking for | Lesson |
|------|--------|
| let / print | 01 |
| Button / @State | 02 |
| Multi-file | 03 |
| List / Navigation | 04 |
| Task / URLSession | 05 |
| JSON | 06 |
| @Observable | 07 |
| Full Todo | 08 |
